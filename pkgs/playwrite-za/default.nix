{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-za-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteza/PlaywriteZA%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteZA_wght_.ttf";
      sha256 = "5bb6e628ad78f8c1d2f59c43eaf4dbf7cd1c1d4df9dcd6e8722e86bdc4d44fa9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteZA_wght_.ttf $out/share/fonts/truetype/PlaywriteZA_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite ZA";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
