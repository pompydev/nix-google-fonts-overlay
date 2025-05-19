{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-be-vlg-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritebevlgguides/PlaywriteBEVLGGuides-Regular.ttf?raw=true";
      name = "PlaywriteBEVLGGuides-Regular.ttf";
      sha256 = "1fcfb1fe45cc1c6f496169f7e7809ba2b92026a54fe8d355982852f7d485534c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteBEVLGGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteBEVLGGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite BE VLG Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
