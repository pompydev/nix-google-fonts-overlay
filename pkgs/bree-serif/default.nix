{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bree-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/breeserif/BreeSerif-Regular.ttf?raw=true";
      name = "BreeSerif-Regular.ttf";
      sha256 = "fd080582d70112ef479ba4ddd72407f9a4fcbcec4caa7d29de259b13eeb5f431";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BreeSerif-Regular.ttf $out/share/fonts/truetype/BreeSerif-Regular.ttf
  '';

  meta = with lib; {
    description = "Bree Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
