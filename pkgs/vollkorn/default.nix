{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vollkorn-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/vollkorn/Vollkorn%5Bwght%5D.ttf?raw=true";
      name = "Vollkorn_wght_.ttf";
      sha256 = "4ebef434f76f80286204840354a84db79a0dc3c87deeeb791e015b70b2ade49d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/vollkorn/Vollkorn-Italic%5Bwght%5D.ttf?raw=true";
      name = "Vollkorn-Italic_wght_.ttf";
      sha256 = "cd947ae49b5d46e812d8d09434fbe8ec452286cd5557ef6a762a3562e2c8d300";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vollkorn_wght_.ttf $out/share/fonts/truetype/Vollkorn_wght_.ttf
     install -Dm644 Vollkorn-Italic_wght_.ttf $out/share/fonts/truetype/Vollkorn-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Vollkorn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
