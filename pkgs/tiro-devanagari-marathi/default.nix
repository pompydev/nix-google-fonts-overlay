{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-devanagari-marathi-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/265268499351c2a22f660b9ded70cb111eea4203/ofl/tirodevanagarimarathi/TiroDevanagariMarathi-Regular.ttf?raw=true";
      name = "TiroDevanagariMarathi-Regular.ttf";
      sha256 = "8e1d4edf924c0685f1383d0d37aa7c4662103d2e485e53b535b4528af5acd966";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/265268499351c2a22f660b9ded70cb111eea4203/ofl/tirodevanagarimarathi/TiroDevanagariMarathi-Italic.ttf?raw=true";
      name = "TiroDevanagariMarathi-Italic.ttf";
      sha256 = "ffa2383d457e468db75775cf19910a4817c3e250da6cfa28a3c6994954ab7d4c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroDevanagariMarathi-Regular.ttf $out/share/fonts/truetype/TiroDevanagariMarathi-Regular.ttf
     install -Dm644 TiroDevanagariMarathi-Italic.ttf $out/share/fonts/truetype/TiroDevanagariMarathi-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Devanagari Marathi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
