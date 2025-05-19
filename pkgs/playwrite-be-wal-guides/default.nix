{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-be-wal-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritebewalguides/PlaywriteBEWALGuides-Regular.ttf?raw=true";
      name = "PlaywriteBEWALGuides-Regular.ttf";
      sha256 = "67db69d03d7a0874b326502e27867234c941a472cc7cddcf6fd2a8f752c84e31";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteBEWALGuides-Regular.ttf $out/share/fonts/truetype/PlaywriteBEWALGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite BE WAL Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
