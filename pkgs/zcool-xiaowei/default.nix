{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zcool-xiaowei-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zcoolxiaowei/ZCOOLXiaoWei-Regular.ttf?raw=true";
      name = "ZCOOLXiaoWei-Regular.ttf";
      sha256 = "a42b620140f493db42f741351dfbf343c0936d58588ee8004b8b2a218d997ff1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZCOOLXiaoWei-Regular.ttf $out/share/fonts/truetype/ZCOOLXiaoWei-Regular.ttf
  '';

  meta = with lib; {
    description = "ZCOOL XiaoWei";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
