{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playwrite-mx-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playwritemx/PlaywriteMX%5Bwght%5D.ttf?raw=true";
      name = "PlaywriteMX_wght_.ttf";
      sha256 = "242dc6731ebf45498878ffd88b1daef3fc1aa5dc7e0eb6ee701466ccd7354a23";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PlaywriteMX_wght_.ttf $out/share/fonts/truetype/PlaywriteMX_wght_.ttf
  '';

  meta = with lib; {
    description = "Playwrite MX";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
