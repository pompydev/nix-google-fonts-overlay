{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-fr-moderne-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritefrmoderneguides/PlaywriteFRModerneGuides-Regular.ttf?raw=true";
      name = "PlaywriteFRModerneGuides-Regular.ttf";
      sha256 = "55cedf88025634e0b459eb63155d42feaaafbdf946165e6e4d2dc586e802f78f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteFRModerneGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteFRModerneGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite FR Moderne Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
