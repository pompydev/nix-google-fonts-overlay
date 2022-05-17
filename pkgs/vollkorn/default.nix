{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vollkorn-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/14cd2acd0902164aa1580c2be3835f9c696044f4/ofl/vollkorn/Vollkorn[wght].ttf?raw=true";
      name = "Vollkorn_wght_.ttf";
      sha256 = "4ebef434f76f80286204840354a84db79a0dc3c87deeeb791e015b70b2ade49d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/14cd2acd0902164aa1580c2be3835f9c696044f4/ofl/vollkorn/Vollkorn-Italic[wght].ttf?raw=true";
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
