{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "atkinson-hyperlegible-mono-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegiblemono/AtkinsonHyperlegibleMono%5Bwght%5D.ttf?raw=true";
      name = "AtkinsonHyperlegibleMono_wght_.ttf";
      sha256 = "5ce8b1698d1ded7dff2178c1a3ad159470085a58ea239e8b2cb88f4fb4a6f646";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegiblemono/AtkinsonHyperlegibleMono-Italic%5Bwght%5D.ttf?raw=true";
      name = "AtkinsonHyperlegibleMono-Italic_wght_.ttf";
      sha256 = "e18f523877530e4abe229df6a36d394326254da488a7f5abb9b7b5ea8f780cd4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AtkinsonHyperlegibleMono_wght_.ttf $out/share/fonts/truetype/AtkinsonHyperlegibleMono_wght_.ttf
     install -Dm644 AtkinsonHyperlegibleMono-Italic_wght_.ttf $out/share/fonts/truetype/AtkinsonHyperlegibleMono-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Atkinson Hyperlegible Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
