{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bentham-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bentham/Bentham-Regular.ttf?raw=true";
      name = "Bentham-Regular.ttf";
      sha256 = "6b5d6ac11b4902fc6912c3afb99520e290f59a56245228ca7529fe3937cba793";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bentham-Regular.ttf $out/share/fonts/truetype/Bentham-Regular.ttf
  '';

  meta = with lib; {
    description = "Bentham";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
