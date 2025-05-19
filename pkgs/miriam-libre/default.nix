{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miriam-libre-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/miriamlibre/MiriamLibre%5Bwght%5D.ttf?raw=true";
      name = "MiriamLibre_wght_.ttf";
      sha256 = "9ea850118d552d25e1fb8242cbd429a5801c691b6ce218458e1a039045114bb8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MiriamLibre_wght_.ttf $out/share/fonts/truetype/MiriamLibre_wght_.ttf
  '';

  meta = with lib; {
    description = "Miriam Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
