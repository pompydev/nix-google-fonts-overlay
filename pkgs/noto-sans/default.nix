{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosans/NotoSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSans_wdth,wght_.ttf";
      sha256 = "bfb7bb691513f12e734dc346c03a03f784912432d7e3fa8e56efcf906fe86b3d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosans/NotoSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSans-Italic_wdth,wght_.ttf";
      sha256 = "58e6e0ebd1931b29a365aa2d3e2ee9a9e831a3af7cf3ad1462d4e72154f0b291";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSans_wdth,wght_.ttf $out/share/fonts/truetype/NotoSans_wdth,wght_.ttf
     install -Dm644 NotoSans-Italic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSans-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
