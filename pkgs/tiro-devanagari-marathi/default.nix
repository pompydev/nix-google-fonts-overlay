{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-devanagari-marathi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirodevanagarimarathi/TiroDevanagariMarathi-Regular.ttf?raw=true";
      name = "TiroDevanagariMarathi-Regular.ttf";
      sha256 = "8e1d4edf924c0685f1383d0d37aa7c4662103d2e485e53b535b4528af5acd966";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tirodevanagarimarathi/TiroDevanagariMarathi-Italic.ttf?raw=true";
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
