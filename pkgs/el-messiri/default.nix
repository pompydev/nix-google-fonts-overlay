{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "el-messiri-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/elmessiri/ElMessiri%5Bwght%5D.ttf?raw=true";
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
