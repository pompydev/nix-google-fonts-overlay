{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orbitron-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/abf71245949027c279caff7c2cb988c97e7d0b11/ofl/orbitron/Orbitron%5Bwght%5D.ttf?raw=true";
      name = "Orbitron_wght_.ttf";
      sha256 = "f42db2dd16e642258e35782916eceb1dcdbea06fb958d77ad71dc5963587e8fd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Orbitron_wght_.ttf $out/share/fonts/truetype/Orbitron_wght_.ttf
  '';

  meta = with lib; {
    description = "Orbitron";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
