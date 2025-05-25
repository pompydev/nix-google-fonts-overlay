{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-gb-j-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritegbj/PlaywriteGBJ%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteGBJ_wght_.ttf";
      sha256 = "75263adf472a717edc4d7d10ea28016591928c98f2cd5da93b0269ef4a919fc9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritegbj/PlaywriteGBJ-Italic%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteGBJ-Italic_wght_.ttf";
      sha256 = "704b51bfa0fdb0a4d4c1514d377c70a986a81577e8df7ce907dc0b4d80457f65";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteGBJ_wght_.ttf $out/share/fonts/truetype/PlaywriteGBJ_wght_.ttf
     install -Dm644 PlaywriteGBJ-Italic_wght_.ttf $out/share/fonts/truetype/PlaywriteGBJ-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite GB J";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
