{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carrois-gothic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/carroisgothic/CarroisGothic-Regular.ttf?raw=true";
      name = "CarroisGothic-Regular.ttf";
      sha256 = "5fa38885ea9f9ea2d42319d1e88ce9170d67b858da7a67a2740460d15d7fcff8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CarroisGothic-Regular.ttf $out/share/fonts/truetype/CarroisGothic-Regular.ttf
  '';

  meta = with lib; {
    description = "Carrois Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
