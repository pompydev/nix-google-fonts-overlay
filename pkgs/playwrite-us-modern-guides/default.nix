{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-us-modern-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteusmodernguides/PlaywriteUSModernGuides-Regular.ttf?raw=true";
      name = "PlaywriteUSModernGuides-Regular.ttf";
      sha256 = "cd487c4dc6b9b401ab888c8113a62e3790ef69b2e25a6db464d07acbce34c9e5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteUSModernGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteUSModernGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite US Modern Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
