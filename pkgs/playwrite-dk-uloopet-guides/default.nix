{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-dk-uloopet-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedkuloopetguides/PlaywriteDKUloopetGuides-Regular.ttf?raw=true";
      name = "PlaywriteDKUloopetGuides-Regular.ttf";
      sha256 = "4424b40f5ff139716a70920ae2e23044d8259f570af137c43425bcd20e986dd7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDKUloopetGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteDKUloopetGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite DK Uloopet Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
