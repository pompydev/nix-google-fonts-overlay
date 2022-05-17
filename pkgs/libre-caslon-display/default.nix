{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-caslon-display-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/95b0ecc63ecac93ff2aab9a410dfe439109bd646/ofl/librecaslondisplay/LibreCaslonDisplay-Regular.ttf?raw=true";
      name = "LibreCaslonDisplay-Regular.ttf";
      sha256 = "2340c497181e9446fcbb235e1c3780558dc62879ffe0ef47906d3f7f35cf5f35";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreCaslonDisplay-Regular.ttf $out/share/fonts/truetype/LibreCaslonDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Caslon Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
