{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-80s-fade-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubik80sfade/Rubik80sFade-Regular.ttf?raw=true";
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
