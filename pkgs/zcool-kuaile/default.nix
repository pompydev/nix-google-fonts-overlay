{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zcool-kuaile-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zcoolkuaile/ZCOOLKuaiLe-Regular.ttf?raw=true";
      name = "ZCOOLKuaiLe-Regular.ttf";
      sha256 = "634fdf8945efec10319a3001f670823dc73d69233481072a743a45c96415967b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZCOOLKuaiLe-Regular.ttf $out/share/fonts/truetype/ZCOOLKuaiLe-Regular.ttf
  '';

  meta = with lib; {
    description = "ZCOOL KuaiLe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
