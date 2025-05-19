{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-in-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteinguides/PlaywriteINGuides-Regular.ttf?raw=true";
      name = "PlaywriteINGuides-Regular.ttf";
      sha256 = "803a92a563111b4e4e97098b85b0c17d8098da9636ecee072a356104aa4884e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteINGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteINGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite IN Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
