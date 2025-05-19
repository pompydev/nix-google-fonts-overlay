{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-vn-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritevnguides/PlaywriteVNGuides-Regular.ttf?raw=true";
      name = "PlaywriteVNGuides-Regular.ttf";
      sha256 = "5af4b813e06cbd14fb40c72a671589fe8a72e63191d8f589e3b5065d68143e0f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteVNGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteVNGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite VN Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
