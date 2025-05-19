{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritecu/PlaywriteCU%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteCU_wght_.ttf";
      sha256 = "d3b045ea6e5b3b18097051c2c85c5cac999d1647a6e24880cc41b9542127c486";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCU_wght_.ttf $out/share/fonts/truetype/PlaywriteCU_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite CU";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
