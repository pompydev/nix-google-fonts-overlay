{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yuji-syuku-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/807bf6c8eb6a18198f7944895bb8ec114ba5f381/ofl/yujisyuku/YujiSyuku-Regular.ttf?raw=true";
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
