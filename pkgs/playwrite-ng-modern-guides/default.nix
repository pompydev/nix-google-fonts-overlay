{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ng-modern-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritengmodernguides/PlaywriteNGModernGuides-Regular.ttf?raw=true";
      name = "PlaywriteNGModernGuides-Regular.ttf";
      sha256 = "9420e0a536cbcaa5bc9c029dab09d2540e9ae6e235daf6517f81eb39174af9f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNGModernGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteNGModernGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite NG Modern Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
