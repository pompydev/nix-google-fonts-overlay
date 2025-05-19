{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-id-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteidguides/PlaywriteIDGuides-Regular.ttf?raw=true";
      name = "PlaywriteIDGuides-Regular.ttf";
      sha256 = "9e9b589240cca165659b09ec468fbd8ba1563879ac7a1b2cf279c787aa83b47c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteIDGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteIDGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite ID Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
