{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-qld-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteauqld/PlaywriteAUQLD%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAUQLD_wght_.ttf";
      sha256 = "ee7b8703daf9f2f17bfae50e9d19145acc93b94a0d76b5e96393d093673959eb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUQLD_wght_.ttf $out/share/fonts/truetype/PlaywriteAUQLD_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU QLD";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
