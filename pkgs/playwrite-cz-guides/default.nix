{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cz-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteczguides/PlaywriteCZGuides-Regular.ttf?raw=true";
      name = "PlaywriteCZGuides-Regular.ttf";
      sha256 = "aca1370567f613c49128d0b84061d0098837cad6c1eaf1e0954917fb99b2afd7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCZGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteCZGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite CZ Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
