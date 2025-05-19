{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zhi-mang-xing-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zhimangxing/ZhiMangXing-Regular.ttf?raw=true";
      name = "ZhiMangXing-Regular.ttf";
      sha256 = "644e0cae9b40f0b10ab729a01bd32032e3973bac22be3dccae01bf6ae7fde969";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZhiMangXing-Regular.ttf $out/share/fonts/truetype/ZhiMangXing-Regular.ttf
  '';

  meta = with lib; {
    description = "Zhi Mang Xing";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
