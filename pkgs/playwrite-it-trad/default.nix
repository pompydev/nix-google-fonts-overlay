{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-it-trad-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteittrad/PlaywriteITTrad%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteITTrad_wght_.ttf";
      sha256 = "51104d891204c4446a326af5c052de5fd9e963b76321cb3ad331144e05b59d8e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteITTrad_wght_.ttf $out/share/fonts/truetype/PlaywriteITTrad_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite IT Trad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
