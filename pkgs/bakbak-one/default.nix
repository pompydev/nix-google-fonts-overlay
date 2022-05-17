{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bakbak-one-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/10e8b3d3084ee57a75fadc74171e3c97c6e4c0b7/ofl/bakbakone/BakbakOne-Regular.ttf?raw=true";
      name = "BakbakOne-Regular.ttf";
      sha256 = "238dd2cf76f0fa33e02ea67c2f9697731378ad567503ca6b1f778778093ff84f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BakbakOne-Regular.ttf $out/share/fonts/truetype/BakbakOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bakbak One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
