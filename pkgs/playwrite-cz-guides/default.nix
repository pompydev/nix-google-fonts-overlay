{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-cz-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteczguides/PlaywriteCZGuides-Regular.ttf?raw=true";
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
