{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "water-brush-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fe95a02e4f1052603e566cc4339ea97d80df5bea/ofl/waterbrush/WaterBrush-Regular.ttf?raw=true";
      name = "WaterBrush-Regular.ttf";
      sha256 = "2cbdccbca5d4be005fe4edd8895b91618a7f96639eaeeb4987ad83e81afc71a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WaterBrush-Regular.ttf $out/share/fonts/truetype/WaterBrush-Regular.ttf
  '';

  meta = with lib; {
    description = "Water Brush";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
