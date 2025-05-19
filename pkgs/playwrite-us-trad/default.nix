{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-us-trad-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwriteustrad/PlaywriteUSTrad%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteUSTrad_wght_.ttf";
      sha256 = "6f2b0ba3c262a4d23bc06ea78ff5eccd45ebf324635d81bac25165eb2a2f1960";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteUSTrad_wght_.ttf $out/share/fonts/truetype/PlaywriteUSTrad_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite US Trad";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
