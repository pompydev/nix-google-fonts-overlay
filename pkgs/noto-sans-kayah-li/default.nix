{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kayah-li-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosanskayahli/NotoSansKayahLi[wght].ttf?raw=true";
      name = "NotoSansKayahLi_wght_.ttf";
      sha256 = "aedb06c6fa773143510e7a623e670a2ba5deee3dbd264b65e383e33e5e41c753";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKayahLi_wght_.ttf $out/share/fonts/truetype/NotoSansKayahLi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kayah Li";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
