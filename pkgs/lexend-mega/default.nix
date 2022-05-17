{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-mega-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexendmega/LexendMega%5Bwght%5D.ttf?raw=true";
      name = "LexendMega_wght_.ttf";
      sha256 = "caf207a658a8519365a89274b64d8bea36ecf5927453d388965789ce7be25df9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LexendMega_wght_.ttf $out/share/fonts/truetype/LexendMega_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend Mega";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
