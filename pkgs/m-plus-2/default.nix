{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-2-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mplus2/MPLUS2%5Bwght%5D.ttf?raw=true";
      name = "MPLUS2_wght_.ttf";
      sha256 = "837dd9cc8ee812e541025f602362ae17d57a5942ab81bea5cc60242e8f6d3f66";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MPLUS2_wght_.ttf $out/share/fonts/truetype/MPLUS2_wght_.ttf
  '';

  meta = with lib; {
    description = "M PLUS 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
