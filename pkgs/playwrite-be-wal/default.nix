{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-be-wal-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritebewal/PlaywriteBEWAL%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteBEWAL_wght_.ttf";
      sha256 = "03b014f5bcb90342eba42f39879869f9c260057e7853f2bbef2e67fda929cefc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteBEWAL_wght_.ttf $out/share/fonts/truetype/PlaywriteBEWAL_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite BE WAL";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
