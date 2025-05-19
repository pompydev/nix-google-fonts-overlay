{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-sa-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteausaguides/PlaywriteAUSAGuides-Regular.ttf?raw=true";
      name = "PlaywriteAUSAGuides-Regular.ttf";
      sha256 = "eb6dfb41295d6dafd463080153e6175e47d852b19559ac210da464c430633774";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUSAGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteAUSAGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU SA Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
