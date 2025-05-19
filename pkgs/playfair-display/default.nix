{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playfair-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playfairdisplay/PlayfairDisplay%5Bwght%5D.ttf?raw=true";
      name = "PlayfairDisplay_wght_.ttf";
      sha256 = "c40f2293766a503bc70cce9e512ef844a4ccb7cbcde792fe2ea31d191917d8d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playfairdisplay/PlayfairDisplay-Italic%5Bwght%5D.ttf?raw=true";
      name = "PlayfairDisplay-Italic_wght_.ttf";
      sha256 = "a5e26dc5e2e77fb2803a0bf02fd4f81ee136ec8dea863ccdb0c59a263b21378b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlayfairDisplay_wght_.ttf $out/share/fonts/truetype/PlayfairDisplay_wght_.ttf
     install -Dm644 PlayfairDisplay-Italic_wght_.ttf $out/share/fonts/truetype/PlayfairDisplay-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Playfair Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
