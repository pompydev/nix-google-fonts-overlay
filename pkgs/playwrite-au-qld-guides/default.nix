{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-qld-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteauqldguides/PlaywriteAUQLDGuides-Regular.ttf?raw=true";
      name = "PlaywriteAUQLDGuides-Regular.ttf";
      sha256 = "d221af7cd6541fe9afff957aad53e4e410c7729f1bf76f0e34b4001cb0f644ab";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUQLDGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteAUQLDGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU QLD Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
