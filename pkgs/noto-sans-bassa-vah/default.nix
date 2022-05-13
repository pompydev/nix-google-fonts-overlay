{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-bassa-vah-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notosansbassavah/NotoSansBassaVah-Regular.ttf?raw=true";
      name = "NotoSansBassaVah-Regular.ttf";
      sha256 = "f00a72b0a05a8bc3da85a07b9a88a77b062737410e319726a0a7b217d8ca8169";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBassaVah-Regular.ttf $out/share/fonts/truetype/NotoSansBassaVah-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Bassa Vah";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
