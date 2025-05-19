{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-spray-paint-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikspraypaint/RubikSprayPaint-Regular.ttf?raw=true";
      name = "RubikSprayPaint-Regular.ttf";
      sha256 = "e608af93c514f2ba78c9ecfb08e90a206a6f5fd4fc3afbd2db1e65bc65129ca1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikSprayPaint-Regular.ttf $out/share/fonts/truetype/RubikSprayPaint-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Spray Paint";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
