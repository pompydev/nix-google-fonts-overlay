{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udpmincho-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2d8896e3a19b7ea3d3b11bef2946d7ca67e6694a/ofl/bizudpmincho/BIZUDPMincho-Regular.ttf?raw=true";
      name = "BIZUDPMincho-Regular.ttf";
      sha256 = "02e07546c51503acb864004b663f1762f099d8fbe1af7d619b185568568101ef";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BIZUDPMincho-Regular.ttf $out/share/fonts/truetype/BIZUDPMincho-Regular.ttf
  '';

  meta = with lib; {
    description = "BIZ UDPMincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
