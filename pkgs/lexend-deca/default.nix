{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-deca-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexenddeca/LexendDeca[wght].ttf?raw=true";
      name = "LexendDeca_wght_.ttf";
      sha256 = "d11c12298f431d7e416a1e615d33f2c2b98bda2318a0c186c8c94f08c2d90ce8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LexendDeca_wght_.ttf $out/share/fonts/truetype/LexendDeca_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend Deca";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
