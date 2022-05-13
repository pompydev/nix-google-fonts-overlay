{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-bubbles-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1a1749768eb76dacf309b1affbf586c4fbbdcefd/ofl/rubikbubbles/RubikBubbles-Regular.ttf?raw=true";
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
