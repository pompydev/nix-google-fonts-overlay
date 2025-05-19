{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-tz-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritetz/PlaywriteTZ%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteTZ_wght_.ttf";
      sha256 = "89b583219a676442f5fa88b57202d4e5334af0c32489b3dd4303106a19de6c9c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteTZ_wght_.ttf $out/share/fonts/truetype/PlaywriteTZ_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite TZ";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
