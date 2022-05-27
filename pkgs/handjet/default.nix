{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "handjet-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16a38d82a0869525a47ec29d3ea960c2f7baace0/ofl/handjet/Handjet%5BEGRD,ESHP,wght%5D.ttf?raw=true";
      name = "Handjet_EGRD,ESHP,wght_.ttf";
      sha256 = "1a0cbd26b4e06485f4a56733686a7ef5640a31bfc6faa055cd7cb36ab2971bed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Handjet_EGRD,ESHP,wght_.ttf $out/share/fonts/truetype/Handjet_EGRD,ESHP,wght_.ttf
  '';

  meta = with lib; {
    description = "Handjet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
