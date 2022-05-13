{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shippori-antique-b1-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d101ebd3b8c8f4dc8f1da2a7001885e943bce1a5/ofl/shipporiantiqueb1/ShipporiAntiqueB1-Regular.ttf?raw=true";
      name = "ShipporiAntiqueB1-Regular.ttf";
      sha256 = "0b55142100b58f6bd221b2229132cc2e344d1d3c803adafeb376624c6e3819c4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShipporiAntiqueB1-Regular.ttf $out/share/fonts/truetype/ShipporiAntiqueB1-Regular.ttf
  '';

  meta = with lib; {
    description = "Shippori Antique B1";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
