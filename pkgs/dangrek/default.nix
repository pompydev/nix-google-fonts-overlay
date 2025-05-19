{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dangrek-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dangrek/Dangrek-Regular.ttf?raw=true";
      name = "Dangrek-Regular.ttf";
      sha256 = "d7dbac288167ef960ea67a5d45890b47419e18c046e90c68ee655a0168e0d06d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Dangrek-Regular.ttf $out/share/fonts/truetype/Dangrek-Regular.ttf
  '';

  meta = with lib; {
    description = "Dangrek";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
