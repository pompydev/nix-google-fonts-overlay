{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hr-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritehrguides/PlaywriteHRGuides-Regular.ttf?raw=true";
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
