{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-co-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteco/PlaywriteCO%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteCO_wght_.ttf";
      sha256 = "0d2291c2ca2df8eab5840abc46726db9b366c4bbc08484d26133f097383afd41";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteCO_wght_.ttf $out/share/fonts/truetype/PlaywriteCO_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite CO";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
