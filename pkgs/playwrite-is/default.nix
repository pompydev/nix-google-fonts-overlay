{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-is-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteis/PlaywriteIS%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteIS_wght_.ttf";
      sha256 = "fcaad619d330aa4dcdf7b2a6dd711a0f9ccd6ddcd66f7a7296f8d0f9e84b28d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteIS_wght_.ttf $out/share/fonts/truetype/PlaywriteIS_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite IS";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
