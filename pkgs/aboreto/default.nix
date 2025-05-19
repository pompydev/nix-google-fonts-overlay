{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aboreto-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/aboreto/Aboreto-Regular.ttf?raw=true";
      name = "Aboreto-Regular.ttf";
      sha256 = "fc702d535857fa2bda802647b9d55f82a07502d4acdfd95b47279b3bf479eaa1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Aboreto-Regular.ttf $out/share/fonts/truetype/Aboreto-Regular.ttf
  '';

  meta = with lib; {
    description = "Aboreto";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
