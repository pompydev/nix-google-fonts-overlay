{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-co-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritecoguides/PlaywriteCOGuides-Regular.ttf?raw=true";
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
