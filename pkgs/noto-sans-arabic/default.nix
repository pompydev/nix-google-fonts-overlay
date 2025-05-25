{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-arabic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansarabic/NotoSansArabic%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansArabic_wdth,wght_.ttf";
      sha256 = "63111b5b2e074dd48cc67692e0a2726d86ee94c1c37fe8598257b7b4e87e869e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansArabic_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansArabic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
