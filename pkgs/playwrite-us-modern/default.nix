{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-us-modern-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteusmodern/PlaywriteUSModern%5Bwght%5D.ttf?raw=true";
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
