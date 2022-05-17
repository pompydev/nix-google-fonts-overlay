{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dangrek-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/dangrek/Dangrek-Regular.ttf?raw=true";
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
