{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chau-philomene-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chauphilomeneone/ChauPhilomeneOne-Regular.ttf?raw=true";
      name = "ChauPhilomeneOne-Regular.ttf";
      sha256 = "2b9fffaa99f228498ee104bab524d7932eb1c49dd635e6be2a060c8ec999c9cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/chauphilomeneone/ChauPhilomeneOne-Italic.ttf?raw=true";
      name = "ChauPhilomeneOne-Italic.ttf";
      sha256 = "4a010ccb1f317377ed9f4b47604102a5db3e50533d37d805d3322e56797218e0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChauPhilomeneOne-Regular.ttf $out/share/fonts/truetype/ChauPhilomeneOne-Regular.ttf
     install -Dm644 ChauPhilomeneOne-Italic.ttf $out/share/fonts/truetype/ChauPhilomeneOne-Italic.ttf
  '';

  meta = with lib; {
    description = "Chau Philomene One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
