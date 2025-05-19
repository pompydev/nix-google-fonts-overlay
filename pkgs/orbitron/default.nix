{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orbitron-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/orbitron/Orbitron%5Bwght%5D.ttf?raw=true";
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
