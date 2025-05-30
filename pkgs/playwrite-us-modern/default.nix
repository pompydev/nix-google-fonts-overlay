{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-us-modern-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwriteusmodern/PlaywriteUSModern%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteUSModern_wght_.ttf";
      sha256 = "1352219a8867e04e25727ec63d35621d704b627a7eb5bf27d7d6f7974e1d3b2d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteUSModern_wght_.ttf $out/share/fonts/truetype/PlaywriteUSModern_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite US Modern";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
