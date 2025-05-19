{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-pixels-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikpixels/RubikPixels-Regular.ttf?raw=true";
      name = "RubikPixels-Regular.ttf";
      sha256 = "2d81a3511bf20e24f1f7bae72029ff4c04134a98a4e0e9ff81e4d664d2412e18";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikPixels-Regular.ttf $out/share/fonts/truetype/RubikPixels-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Pixels";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
