{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "song-myung-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/songmyung/SongMyung-Regular.ttf?raw=true";
      name = "SongMyung-Regular.ttf";
      sha256 = "7f90ab20250911560212cc5819c7b205f9c6644bb96b65095d89fcae096bbf58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SongMyung-Regular.ttf $out/share/fonts/truetype/SongMyung-Regular.ttf
  '';

  meta = with lib; {
    description = "Song Myung";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
