{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-ro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritero/PlaywriteRO%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteRO_wght_.ttf";
      sha256 = "49e9f323794988f03a739fccb605d5f966c620987c68b50d0eefb9c4250a7b62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteRO_wght_.ttf $out/share/fonts/truetype/PlaywriteRO_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite RO";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
