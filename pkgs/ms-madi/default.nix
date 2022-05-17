{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ms-madi-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/74cce0a70b8f579e503f0b11234d5007c1d2b11d/ofl/msmadi/MsMadi-Regular.ttf?raw=true";
      name = "MsMadi-Regular.ttf";
      sha256 = "08dfe959077490d11a4dd0d3097b48daafdecef821e290c973cd1893595cc208";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MsMadi-Regular.ttf $out/share/fonts/truetype/MsMadi-Regular.ttf
  '';

  meta = with lib; {
    description = "Ms Madi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
