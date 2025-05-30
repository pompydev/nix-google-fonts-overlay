{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carrois-gothic-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carroisgothic/CarroisGothic-Regular.ttf?raw=true";
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
