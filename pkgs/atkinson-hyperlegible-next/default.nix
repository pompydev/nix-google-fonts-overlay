{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "atkinson-hyperlegible-next-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegiblenext/AtkinsonHyperlegibleNext%5Bwght%5D.ttf?raw=true";
      name = "AtkinsonHyperlegibleNext_wght_.ttf";
      sha256 = "5a455d1cfa099b601ab70751bb9673e8fe1854dc4500c80e1a220d0d75e31745";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/atkinsonhyperlegiblenext/AtkinsonHyperlegibleNext-Italic%5Bwght%5D.ttf?raw=true";
      name = "AtkinsonHyperlegibleNext-Italic_wght_.ttf";
      sha256 = "ce9cffed32742ad2d9238c561a93220385e5934cdc02b8eb4097a50efa957dc6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AtkinsonHyperlegibleNext_wght_.ttf $out/share/fonts/truetype/AtkinsonHyperlegibleNext_wght_.ttf
     install -Dm644 AtkinsonHyperlegibleNext-Italic_wght_.ttf $out/share/fonts/truetype/AtkinsonHyperlegibleNext-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Atkinson Hyperlegible Next";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
