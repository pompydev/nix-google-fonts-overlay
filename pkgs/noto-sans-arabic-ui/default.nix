{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-arabic-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansarabicui/NotoSansArabicUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansArabicUI_wdth,wght_.ttf";
      sha256 = "2d47090f7a3de2fd01ba8aff9a775263b3ab70a46cd2a6bfe3d1c3e1dd89ffe5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansArabicUI_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansArabicUI_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Arabic UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
