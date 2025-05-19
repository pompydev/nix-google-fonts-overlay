{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chau-philomene-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chauphilomeneone/ChauPhilomeneOne-Regular.ttf?raw=true";
      name = "ChauPhilomeneOne-Regular.ttf";
      sha256 = "2b9fffaa99f228498ee104bab524d7932eb1c49dd635e6be2a060c8ec999c9cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chauphilomeneone/ChauPhilomeneOne-Italic.ttf?raw=true";
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
