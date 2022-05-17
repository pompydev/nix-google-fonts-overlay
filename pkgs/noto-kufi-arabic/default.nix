{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-kufi-arabic-${version}";
  version = "2022-04-28-030829";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f7d34edb8b8aa4aa3c19e49ea7ece1ac9b354e7b/ofl/notokufiarabic/NotoKufiArabic[wght].ttf?raw=true";
      name = "NotoKufiArabic_wght_.ttf";
      sha256 = "e315b2a227ffed14f9d58860c784b82cf88ea90802c902da11f9acb65b25dabd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoKufiArabic_wght_.ttf $out/share/fonts/truetype/NotoKufiArabic_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Kufi Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
