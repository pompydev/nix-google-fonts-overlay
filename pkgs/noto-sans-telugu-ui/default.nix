{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-telugu-ui-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansteluguui/NotoSansTeluguUI[wdth,wght].ttf?raw=true";
      name = "NotoSansTeluguUI[wdth,wght].ttf";
      sha256 = "9464e0ca55c7310fbc9299f9afaeb3720efee9b3d91813999af7dae276cc1fc0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'NotoSansTeluguUI[wdth,wght].ttf' $out/share/fonts/truetype/'NotoSansTeluguUI[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Noto Sans Telugu UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
