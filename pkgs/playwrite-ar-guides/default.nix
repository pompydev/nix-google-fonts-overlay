{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ar-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritearguides/PlaywriteARGuides-Regular.ttf?raw=true";
      name = "PlaywriteARGuides-Regular.ttf";
      sha256 = "33f62016b1c927f6ce9621a29177bed07024146405070610c62c8d8a6ebd6eeb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteARGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteARGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite AR Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
