{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-pe-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritepe/PlaywritePE%5Bwght%5D.ttf?raw=true";
      name = "PlaywritePE_wght_.ttf";
      sha256 = "12f8dedcc060802869dea94b45b3edfe46c185f8052738916a0864f2d6ead846";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywritePE_wght_.ttf $out/share/fonts/truetype/PlaywritePE_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite PE";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
