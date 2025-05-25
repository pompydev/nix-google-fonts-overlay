{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-au-tas-guides-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteautasguides/PlaywriteAUTASGuides-Regular.ttf?raw=true";
      name = "PlaywriteAUTASGuides-Regular.ttf";
      sha256 = "197986b0448dbc9dc9b3aa902c090c684aa1f9e70cd2c0e8533fbc49b119a4a5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteAUTASGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteAUTASGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite AU TAS Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
