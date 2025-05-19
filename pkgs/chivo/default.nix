{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chivo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chivo/Chivo%5Bwght%5D.ttf?raw=true";
      name = "Chivo_wght_.ttf";
      sha256 = "801674cbeff749011a0186b2c932dc9158187a8ca4ca6598db2a1f5c7c4342d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chivo/Chivo-Italic%5Bwght%5D.ttf?raw=true";
      name = "Chivo-Italic_wght_.ttf";
      sha256 = "502339e1cda77e24b5cd46a1a875e4c5e6f20ea019c248f57f23423527030ff3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chivo_wght_.ttf $out/share/fonts/truetype/Chivo_wght_.ttf
     install -Dm644 Chivo-Italic_wght_.ttf $out/share/fonts/truetype/Chivo-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Chivo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
