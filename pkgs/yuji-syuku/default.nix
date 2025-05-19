{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-syuku-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/yujisyuku/YujiSyuku-Regular.ttf?raw=true";
      name = "YujiSyuku-Regular.ttf";
      sha256 = "82728ebafc8c97391e2dab633414a806f344b8e4e2227d307179f07b548fca61";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 YujiSyuku-Regular.ttf $out/share/fonts/truetype/YujiSyuku-Regular.ttf
  '';

  meta = with lib; {
    description = "Yuji Syuku";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
