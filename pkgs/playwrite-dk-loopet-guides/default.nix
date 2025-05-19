{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-dk-loopet-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedkloopetguides/PlaywriteDKLoopetGuides-Regular.ttf?raw=true";
      name = "PlaywriteDKLoopetGuides-Regular.ttf";
      sha256 = "ebd1e215cb8a9d5baeeb559fd52115f1e79101c81089a97118d5a3c9aa5b0e87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDKLoopetGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteDKLoopetGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite DK Loopet Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
