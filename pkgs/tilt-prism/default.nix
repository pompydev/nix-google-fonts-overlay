{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tilt-prism-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tiltprism/TiltPrism%5BXROT,YROT%5D.ttf?raw=true";
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
