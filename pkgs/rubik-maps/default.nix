{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-maps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikmaps/RubikMaps-Regular.ttf?raw=true";
      name = "RubikMaps-Regular.ttf";
      sha256 = "ebb439b66ec111e6ca61f9081801cb35445afcedbb3d9749932979d65c69efa1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMaps-Regular.ttf $out/share/fonts/truetype/RubikMaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Maps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
