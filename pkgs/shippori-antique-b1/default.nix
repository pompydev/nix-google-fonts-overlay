{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shippori-antique-b1-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shipporiantiqueb1/ShipporiAntiqueB1-Regular.ttf?raw=true";
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
