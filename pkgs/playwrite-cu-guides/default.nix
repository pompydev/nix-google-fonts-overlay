{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cu-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritecuguides/PlaywriteCUGuides-Regular.ttf?raw=true";
      name = "PlaywriteCUGuides-Regular.ttf";
      sha256 = "b5a04b61dfd6cac191ab5852a7ecccaf4bf79124c9470252b0d754cfe3755647";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCUGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteCUGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite CU Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
