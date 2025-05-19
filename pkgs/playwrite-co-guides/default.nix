{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-co-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritecoguides/PlaywriteCOGuides-Regular.ttf?raw=true";
      name = "PlaywriteCOGuides-Regular.ttf";
      sha256 = "d4ac1c4086cd19277d02be1b1dec2655663b34e15d31704c765a1d4b7f4c1b03";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCOGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteCOGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite CO Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
