{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmbx10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/jsmathcmbx10/jsMath-cmbx10.ttf?raw=true";
      name = "jsMath-cmbx10.ttf";
      sha256 = "e4aa545e2391f90f9c6c823e67ab0b682a6a8e1711f72a2ffc120458b519fac4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmbx10.ttf $out/share/fonts/truetype/jsMath-cmbx10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmbx10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
