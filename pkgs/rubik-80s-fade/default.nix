{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-80s-fade-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubik80sfade/Rubik80sFade-Regular.ttf?raw=true";
      name = "Rubik80sFade-Regular.ttf";
      sha256 = "da14679ae16caaf4ad32aece9a7357dcdea02c5d7c9b1d296faba86e19862d3f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rubik80sFade-Regular.ttf $out/share/fonts/truetype/Rubik80sFade-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik 80s Fade";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
