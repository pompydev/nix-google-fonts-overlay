{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-bubbles-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikbubbles/RubikBubbles-Regular.ttf?raw=true";
      name = "RubikBubbles-Regular.ttf";
      sha256 = "2171521dab2b1b3675bbb7aecd34b1c169167c360e3647dadb4939910490c974";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikBubbles-Regular.ttf $out/share/fonts/truetype/RubikBubbles-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Bubbles";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
