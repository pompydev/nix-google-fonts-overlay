{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hu-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritehu/PlaywriteHU%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteHU_wght_.ttf";
      sha256 = "0eccb4d38487bedd44dba0a7be9ce3eb2b4f67d9928071041d195f537bb96151";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteHU_wght_.ttf $out/share/fonts/truetype/PlaywriteHU_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite HU";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
