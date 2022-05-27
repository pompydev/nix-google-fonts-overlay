{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kosugi-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9fc4eac722cec1cbb58b3c85c2f687bc39eda180/apache/kosugi/Kosugi-Regular.ttf?raw=true";
      name = "Kosugi-Regular.ttf";
      sha256 = "f5e81d6a6b865d9b88c54d2d3c16bcaa3b239dfcefaf2a62976ac9dc7574bab7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kosugi-Regular.ttf $out/share/fonts/truetype/Kosugi-Regular.ttf
  '';

  meta = with lib; {
    description = "Kosugi";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
