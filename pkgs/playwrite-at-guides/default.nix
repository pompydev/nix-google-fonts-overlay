{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-at-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteatguides/PlaywriteATGuides-Regular.ttf?raw=true";
      name = "PlaywriteATGuides-Regular.ttf";
      sha256 = "7708b88b250f4cb7a5a6395c97ffb46daf80034e2954c497b7c1a34ac6401ff6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteatguides/PlaywriteATGuides-Italic.ttf?raw=true";
      name = "PlaywriteATGuides-Italic.ttf";
      sha256 = "a9f075e96d4c33b614c5454a7b6b3e6f4ca68cfed0f3674713d3d0369f7dd058";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteATGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteATGuides-Regular.ttf
     install -Dm644 PlaywriteATGuides-Italic.ttf $out/share/fonts/truetype/PlaywriteATGuides-Italic.ttf
  '';

  meta = with lib; {
    description = "Playwrite AT Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
