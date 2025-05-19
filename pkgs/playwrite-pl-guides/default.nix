{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-pl-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteplguides/PlaywritePLGuides-Regular.ttf?raw=true";
      name = "PlaywritePLGuides-Regular.ttf";
      sha256 = "d627f9f741bd66d62d9da2fa6a262f28896dde1db9fe32ab0229dbf8d7afa5ca";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywritePLGuides-Regular.ttf $out/share/fonts/truetype/PlaywritePLGuides-Regular.ttf
  '';

  meta = with lib; {
    description = "Playwrite PL Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
