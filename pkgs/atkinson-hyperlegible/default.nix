{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "atkinson-hyperlegible-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegible/AtkinsonHyperlegible-Regular.ttf?raw=true";
      name = "AtkinsonHyperlegible-Regular.ttf";
      sha256 = "7fb917c89019896d0b52ee84b7cbb3304c18cb90b19a62f5e32712bd23e97669";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegible/AtkinsonHyperlegible-Italic.ttf?raw=true";
      name = "AtkinsonHyperlegible-Italic.ttf";
      sha256 = "021beda4d3c6edfc78872e436d74009f9a1bcb294331908fe5747c61d3dcc514";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegible/AtkinsonHyperlegible-Bold.ttf?raw=true";
      name = "AtkinsonHyperlegible-Bold.ttf";
      sha256 = "5a3b0c8cc8ca545155150b4512a1fa248298df121c50d6557e651e61fbdab92f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegible/AtkinsonHyperlegible-BoldItalic.ttf?raw=true";
      name = "AtkinsonHyperlegible-BoldItalic.ttf";
      sha256 = "7a46f1b0ef2f64b61065c1a6b5a11fcb9b019b44062d88ba121a083cc39e86bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AtkinsonHyperlegible-Regular.ttf $out/share/fonts/truetype/AtkinsonHyperlegible-Regular.ttf
     install -Dm644 AtkinsonHyperlegible-Italic.ttf $out/share/fonts/truetype/AtkinsonHyperlegible-Italic.ttf
     install -Dm644 AtkinsonHyperlegible-Bold.ttf $out/share/fonts/truetype/AtkinsonHyperlegible-Bold.ttf
     install -Dm644 AtkinsonHyperlegible-BoldItalic.ttf $out/share/fonts/truetype/AtkinsonHyperlegible-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Atkinson Hyperlegible";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
