{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-nz-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritenz/PlaywriteNZ%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteNZ_wght_.ttf";
      sha256 = "2fe05597c1d04f734bbbdd91ca6846767512939ca254c0ea81fb48bfd9b47a30";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteNZ_wght_.ttf $out/share/fonts/truetype/PlaywriteNZ_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite NZ";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
