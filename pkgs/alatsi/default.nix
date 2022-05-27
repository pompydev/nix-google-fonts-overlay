{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alatsi-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3d91fe855aa2d3e40f003b337d77adcedbe4d917/ofl/alatsi/Alatsi-Regular.ttf?raw=true";
      name = "Alatsi-Regular.ttf";
      sha256 = "f2662b6c86cf6d31119b9d42851f43c820fa102f5d54295e34ef60aef22c1359";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alatsi-Regular.ttf $out/share/fonts/truetype/Alatsi-Regular.ttf
  '';

  meta = with lib; {
    description = "Alatsi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
