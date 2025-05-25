{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-naskh-arabic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notonaskharabic/NotoNaskhArabic%5Bwght%5D.ttf?raw=true";
      name = "NotoNaskhArabic_wght_.ttf";
      sha256 = "4b5bcbca51d8a1b0fc598db42a497660e538f75c1244893d3330a3c7b15741da";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoNaskhArabic_wght_.ttf $out/share/fonts/truetype/NotoNaskhArabic_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Naskh Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
