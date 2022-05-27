{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-slab-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d1933f61bbd8d55a9879f07e0b4b36c73f126c56/ofl/josefinslab/JosefinSlab%5Bwght%5D.ttf?raw=true";
      name = "JosefinSlab_wght_.ttf";
      sha256 = "2d1316f95cb11dad6e73b1fb1006c0ecb3bd95a40583c1946d27868a75672b1b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d1933f61bbd8d55a9879f07e0b4b36c73f126c56/ofl/josefinslab/JosefinSlab-Italic%5Bwght%5D.ttf?raw=true";
      name = "JosefinSlab-Italic_wght_.ttf";
      sha256 = "b9139992b266820d626c8035fe3080dba68d67cd79d3809f4aad0a1cc4b8e5b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JosefinSlab_wght_.ttf $out/share/fonts/truetype/JosefinSlab_wght_.ttf
     install -Dm644 JosefinSlab-Italic_wght_.ttf $out/share/fonts/truetype/JosefinSlab-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Josefin Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
