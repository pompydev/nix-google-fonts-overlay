{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "figtree-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/figtree/Figtree%5Bwght%5D.ttf?raw=true";
      name = "Figtree_wght_.ttf";
      sha256 = "26ad3db9b31ff7dde67a91ff515d022d2f495cd506590699cf264f0bfe6fb714";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/figtree/Figtree-Italic%5Bwght%5D.ttf?raw=true";
      name = "Figtree-Italic_wght_.ttf";
      sha256 = "94dec1f18b9275d69e8b4a91b6514bdc18199048347e1c36e1285b11b0b87653";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Figtree_wght_.ttf $out/share/fonts/truetype/Figtree_wght_.ttf
     install -Dm644 Figtree-Italic_wght_.ttf $out/share/fonts/truetype/Figtree-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Figtree";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
