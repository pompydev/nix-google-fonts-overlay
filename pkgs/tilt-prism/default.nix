{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tilt-prism-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tiltprism/TiltPrism%5BXROT,YROT%5D.ttf?raw=true";
      name = "TiltPrism_XROT,YROT_.ttf";
      sha256 = "28e96351753e177dc6e097f7f089c6942cdf26416e861f4ab9d6ee0bc57c7515";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiltPrism_XROT-YROT_.ttf $out/share/fonts/truetype/TiltPrism_XROT-YROT_.ttf
  '';

  meta = with lib; {
    description = "Tilt Prism";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
