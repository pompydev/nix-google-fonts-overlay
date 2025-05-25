{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cu-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritecuguides/PlaywriteCUGuides-Regular.ttf?raw=true";
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
