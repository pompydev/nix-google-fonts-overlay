{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "exo-2-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8d29a3e2062681d3793fcf5bb1a156dcc8281987/ofl/exo2/Exo2%5Bwght%5D.ttf?raw=true";
      name = "Exo2_wght_.ttf";
      sha256 = "6dc268b35134ea07db4ea6b19c965bc82e650cefbd1e4f8fb265bfc4e630c897";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/8d29a3e2062681d3793fcf5bb1a156dcc8281987/ofl/exo2/Exo2-Italic%5Bwght%5D.ttf?raw=true";
      name = "Exo2-Italic_wght_.ttf";
      sha256 = "6b8089c27e1a29b3c7e22eade6190f5c756d0abdd20a0d5c736afdec6d29a942";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Exo2_wght_.ttf $out/share/fonts/truetype/Exo2_wght_.ttf
     install -Dm644 Exo2-Italic_wght_.ttf $out/share/fonts/truetype/Exo2-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Exo 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
