{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zcool-kuaile-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/zcoolkuaile/ZCOOLKuaiLe-Regular.ttf?raw=true";
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
