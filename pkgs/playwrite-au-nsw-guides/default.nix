{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-nsw-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteaunswguides/PlaywriteAUNSWGuides-Regular.ttf?raw=true";
      name = "PlaywriteAUNSWGuides-Regular.ttf";
      sha256 = "06f40972bde2537413aea34fcb4e9ca40b1b1dbbd0cb9a5a159bd6cda2b473e3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUNSWGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteAUNSWGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU NSW Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
