{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fuzzy-bubbles-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19311a025d3069c8882a130bce378178e45dac9f/ofl/fuzzybubbles/FuzzyBubbles-Regular.ttf?raw=true";
      name = "FuzzyBubbles-Regular.ttf";
      sha256 = "407829f1e0b6b73a9482ffdfd22702bb149a020fad33f95eb30bc98bf9d471d5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/19311a025d3069c8882a130bce378178e45dac9f/ofl/fuzzybubbles/FuzzyBubbles-Bold.ttf?raw=true";
      name = "FuzzyBubbles-Bold.ttf";
      sha256 = "f18fa58c66cf2540800f10ae4c9ae315c89149c41ace2a394c5efca7354c4ea8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FuzzyBubbles-Regular.ttf $out/share/fonts/truetype/FuzzyBubbles-Regular.ttf
     install -Dm644 FuzzyBubbles-Bold.ttf $out/share/fonts/truetype/FuzzyBubbles-Bold.ttf
  '';

  meta = with lib; {
    description = "Fuzzy Bubbles";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
