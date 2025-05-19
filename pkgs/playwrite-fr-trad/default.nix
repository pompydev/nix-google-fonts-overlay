{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-fr-trad-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritefrtrad/PlaywriteFRTrad%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteFRTrad_wght_.ttf";
      sha256 = "0f20dd00ba639dc19e9095e8239a7667d92922c2fd6b69bd3ffb600b90ae4845";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteFRTrad_wght_.ttf $out/share/fonts/truetype/PlaywriteFRTrad_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite FR Trad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
