{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "quando-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/quando/Quando-Regular.ttf?raw=true";
      name = "Quando-Regular.ttf";
      sha256 = "1c6bab1b4b3bf31a305d3866c3826e04237e8da9d9acfa84f49ab138394e8909";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Quando-Regular.ttf $out/share/fonts/truetype/Quando-Regular.ttf
  '';

  meta = with lib; {
    description = "Quando";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
