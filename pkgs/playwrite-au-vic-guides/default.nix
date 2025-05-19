{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-vic-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteauvicguides/PlaywriteAUVICGuides-Regular.ttf?raw=true";
      name = "PlaywriteAUVICGuides-Regular.ttf";
      sha256 = "694a0911082d224435d3c80b8d75f72ba1ee974f4d6415d370f45882a926c6f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUVICGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteAUVICGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU VIC Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
