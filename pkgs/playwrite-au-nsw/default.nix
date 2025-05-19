{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-nsw-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteaunsw/PlaywriteAUNSW%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteAUNSW_wght_.ttf";
      sha256 = "84d3de3d1e53e3b628b9c1677bb7fcfe18deab90c825bfd44d53377725d415ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUNSW_wght_.ttf $out/share/fonts/truetype/PlaywriteAUNSW_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU NSW";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
