{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-dk-loopet-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedkloopet/PlaywriteDKLoopet%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteDKLoopet_wght_.ttf";
      sha256 = "9e147e232e040f810ba93d8ad83676246a824accf5621239501f3068bbfd07b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDKLoopet_wght_.ttf $out/share/fonts/truetype/PlaywriteDKLoopet_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite DK Loopet";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
