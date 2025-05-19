{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "maiden-orange-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/maidenorange/MaidenOrange-Regular.ttf?raw=true";
      name = "MaidenOrange-Regular.ttf";
      sha256 = "fd63e44269350a9761db9a88db9a301c82671123c7a9550fa4004b26b5d16200";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MaidenOrange-Regular.ttf $out/share/fonts/truetype/MaidenOrange-Regular.ttf
  '';

  meta = with lib; {
    description = "Maiden Orange";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
