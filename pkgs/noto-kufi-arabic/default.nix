{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-kufi-arabic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notokufiarabic/NotoKufiArabic%5Bwght%5D.ttf?raw=true";
      name = "NotoKufiArabic_wght_.ttf";
      sha256 = "494f6b61469d7a02a2d63f0fc4930bb007388d8cfe551de5eb98354e100889f3";
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
