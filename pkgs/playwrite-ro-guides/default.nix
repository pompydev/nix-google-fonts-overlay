{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ro-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteroguides/PlaywriteROGuides-Regular.ttf?raw=true";
      name = "PlaywriteROGuides-Regular.ttf";
      sha256 = "273be2263db17dc6e2367a642b4d30b7159787f16bf8bdb0cfcf86e184f1acf5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteROGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteROGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite RO Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
