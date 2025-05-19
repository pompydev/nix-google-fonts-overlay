{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rakkas-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rakkas/Rakkas-Regular.ttf?raw=true";
      name = "Rakkas-Regular.ttf";
      sha256 = "54278882e4774c14d50c3b555f127d0fe586366d5b787316ebbcbd8108829e60";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rakkas-Regular.ttf $out/share/fonts/truetype/Rakkas-Regular.ttf
  '';

  meta = with lib; {
    description = "Rakkas";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
