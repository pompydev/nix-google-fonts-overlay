{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-es-deco-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteesdeco/PlaywriteESDeco%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteESDeco_wght_.ttf";
      sha256 = "feb4d1800692b940efdfaa453b2963d8af2015ed3c0bde7d02400d065856f8f0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteESDeco_wght_.ttf $out/share/fonts/truetype/PlaywriteESDeco_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite ES Deco";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
