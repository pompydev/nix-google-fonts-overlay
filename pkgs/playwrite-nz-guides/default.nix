{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-nz-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritenzguides/PlaywriteNZGuides-Regular.ttf?raw=true";
      name = "PlaywriteNZGuides-Regular.ttf";
      sha256 = "64caa30ba74f7fea2beaaa611817ed37f5c3288b61b028ae76f78724550fdb51";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNZGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteNZGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite NZ Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
