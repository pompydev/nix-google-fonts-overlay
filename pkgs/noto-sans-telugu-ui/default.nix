{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-telugu-ui-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansteluguui/NotoSansTeluguUI%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSansTeluguUI_wdth,wght_.ttf";
      sha256 = "9464e0ca55c7310fbc9299f9afaeb3720efee9b3d91813999af7dae276cc1fc0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansTeluguUI_wdth-wght_.ttf $out/share/fonts/truetype/NotoSansTeluguUI_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Telugu UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
