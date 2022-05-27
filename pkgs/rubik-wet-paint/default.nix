{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-wet-paint-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/853513d0d859043b246db39bb45918e93b097c48/ofl/rubikwetpaint/RubikWetPaint-Regular.ttf?raw=true";
      name = "RubikWetPaint-Regular.ttf";
      sha256 = "3f35d1c77219c5219826b23c2f0c72dd0eed46425a0d4fff21b8827cdce61693";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikWetPaint-Regular.ttf $out/share/fonts/truetype/RubikWetPaint-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Wet Paint";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
