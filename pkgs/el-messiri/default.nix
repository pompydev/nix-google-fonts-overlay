{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "el-messiri-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a1b41d3a87354004b98884ac5f442a4e88954b56/ofl/elmessiri/ElMessiri%5Bwght%5D.ttf?raw=true";
      name = "ElMessiri_wght_.ttf";
      sha256 = "5d58d5259d2accccba39cffe12e1226e88b6afc5150e3605eb2a9c2fe06ccab0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ElMessiri_wght_.ttf $out/share/fonts/truetype/ElMessiri_wght_.ttf
  '';

  meta = with lib; {
    description = "El Messiri";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
