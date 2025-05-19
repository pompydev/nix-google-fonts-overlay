{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-de-grund-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritedegrundguides/PlaywriteDEGrundGuides-Regular.ttf?raw=true";
      name = "PlaywriteDEGrundGuides-Regular.ttf";
      sha256 = "b1feda1a1471d30f535f15b95e35bf2b975d89668740bc3a91c3f20cd8a83fb5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteDEGrundGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteDEGrundGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite DE Grund Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
