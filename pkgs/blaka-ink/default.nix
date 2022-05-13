{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-ink-${version}";
  version = "2022-05-06-031916";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35a8cf3bf9ae2f862abf63d18fdeadb70694fad1/ofl/blakaink/BlakaInk-Regular.ttf?raw=true";
      name = "BlakaInk-Regular.ttf";
      sha256 = "7621e0b1ffd25da31d07268677a774698dd94e604bdb75733da48c20fd3369ad";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlakaInk-Regular.ttf $out/share/fonts/truetype/BlakaInk-Regular.ttf
  '';

  meta = with lib; {
    description = "Blaka Ink";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
