{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-nsw-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteaunswguides/PlaywriteAUNSWGuides-Regular.ttf?raw=true";
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
