{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orbitron-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/abf71245949027c279caff7c2cb988c97e7d0b11/ofl/orbitron/Orbitron[wght].ttf?raw=true";
      name = "Orbitron[wght].ttf";
      sha256 = "f42db2dd16e642258e35782916eceb1dcdbea06fb958d77ad71dc5963587e8fd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Orbitron[wght].ttf' $out/share/fonts/truetype/'Orbitron[wght].ttf'
  '';

  meta = with lib; {
    description = "Orbitron";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
