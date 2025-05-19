{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ar-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritearguides/PlaywriteARGuides-Regular.ttf?raw=true";
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
