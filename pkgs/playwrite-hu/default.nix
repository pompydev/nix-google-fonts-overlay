{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-hu-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/playwritehu/PlaywriteHU%5Bwght%5D.ttf?raw=true";
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
