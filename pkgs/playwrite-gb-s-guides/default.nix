{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-gb-s-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritegbsguides/PlaywriteGBSGuides-Regular.ttf?raw=true";
      name = "PlaywriteGBSGuides-Regular.ttf";
      sha256 = "1442c14aa7a3a69e55b411f81202f256f522e1ed996b3827373a9f2df66f8a5b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritegbsguides/PlaywriteGBSGuides-Italic.ttf?raw=true";
      name = "PlaywriteGBSGuides-Italic.ttf";
      sha256 = "ad25fe43821cefc2ddabac97ef5ea26a5742e05ee997cefed1bf62e96095dafc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteGBSGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteGBSGuides-Regular.ttf
     install -Dm644 PlaywriteGBSGuides-Italic.ttf $out/share/fonts/truetype/PlaywriteGBSGuides-Italic.ttf
  '';

  meta = with lib; {
    description = "Playwrite GB S Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
