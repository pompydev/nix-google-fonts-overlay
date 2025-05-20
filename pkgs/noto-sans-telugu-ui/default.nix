{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-telugu-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansteluguui/NotoSansTeluguUI%5Bwdth,wght%5D.ttf?raw=true";
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
