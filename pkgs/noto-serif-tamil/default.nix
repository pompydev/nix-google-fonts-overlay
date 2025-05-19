{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tamil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriftamil/NotoSerifTamil%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifTamil_wdth,wght_.ttf";
      sha256 = "4b10fe56ee22907a80136c16dbe386ee20f3bf116332b35128bb35eeb775d91e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoseriftamil/NotoSerifTamil-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifTamil-Italic_wdth,wght_.ttf";
      sha256 = "fd83887a38aa103aade5e6f73437386bf010bec2afac5b5973e4996c1a98193b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTamil_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifTamil_wdth,wght_.ttf
     install -Dm644 NotoSerifTamil-Italic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifTamil-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
