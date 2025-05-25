{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-fr-trad-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritefrtradguides/PlaywriteFRTradGuides-Regular.ttf?raw=true";
      name = "PlaywriteFRTradGuides-Regular.ttf";
      sha256 = "85b02ebe0c35cd33e5d80d13bbde4ca348b62a2eeddf0327ee8b746419895740";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteFRTradGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteFRTradGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite FR Trad Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
