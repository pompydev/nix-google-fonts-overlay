{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-microbe-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/25163d4b1689c331d3a58c4a56f0b9d60b1f94a1/ofl/rubikmicrobe/RubikMicrobe-Regular.ttf?raw=true";
      name = "RubikMicrobe-Regular.ttf";
      sha256 = "af2360aa13ce3a068142dedded39d2d831615d8bbe370bc086e95192f2e528d7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMicrobe-Regular.ttf $out/share/fonts/truetype/RubikMicrobe-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Microbe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
