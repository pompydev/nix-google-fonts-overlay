{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-it-trad-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteittrad/PlaywriteITTrad%5Bwght%5D.ttf?raw=true";
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
