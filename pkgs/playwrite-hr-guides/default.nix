{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hr-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritehrguides/PlaywriteHRGuides-Regular.ttf?raw=true";
      name = "PlaywriteHRGuides-Regular.ttf";
      sha256 = "2ef02a50dc4366f1bb8c26859be983992bb3b543fdf126a555b1f6172b7adcd1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteHRGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteHRGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite HR Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
