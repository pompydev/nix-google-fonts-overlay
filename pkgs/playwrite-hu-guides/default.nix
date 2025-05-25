{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hu-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritehuguides/PlaywriteHUGuides-Regular.ttf?raw=true";
      name = "PlaywriteHUGuides-Regular.ttf";
      sha256 = "8488e55b32a63dba711bd799daf4ac5e951ab44265f61e4626d48181cbcef98c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteHUGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteHUGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite HU Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
