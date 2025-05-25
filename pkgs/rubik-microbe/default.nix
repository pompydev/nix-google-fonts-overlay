{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-microbe-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikmicrobe/RubikMicrobe-Regular.ttf?raw=true";
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
