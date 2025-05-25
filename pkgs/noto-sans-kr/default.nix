{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kr-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanskr/NotoSansKR%5Bwght%5D.ttf?raw=true";
      name = "NotoSansKR_wght_.ttf";
      sha256 = "194018e6b2b293a7964f037b25c0249ce1418bc9ab3c971060a03aa57861e252";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKR_wght_.ttf $out/share/fonts/truetype/NotoSansKR_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans KR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
