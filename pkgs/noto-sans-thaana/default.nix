{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-thaana-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansthaana/NotoSansThaana[wght].ttf?raw=true";
      name = "NotoSansThaana_wght_.ttf";
      sha256 = "dfbdfa4ec44ee90e654882805ed38e260da9314ada3fe2e6e62ee76f0addec04";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansThaana_wght_.ttf $out/share/fonts/truetype/NotoSansThaana_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Thaana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
