{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tiro-gurmukhi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tirogurmukhi/TiroGurmukhi-Regular.ttf?raw=true";
      name = "TiroGurmukhi-Regular.ttf";
      sha256 = "49d6959474d232763ed5b16c786c9e7ff0587c70c141efe78c070e709014a57d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tirogurmukhi/TiroGurmukhi-Italic.ttf?raw=true";
      name = "TiroGurmukhi-Italic.ttf";
      sha256 = "01d2b2b13d1859005c87bf29c86389f2c7cabcb5672e54d03447990bd3ba7b71";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiroGurmukhi-Regular.ttf $out/share/fonts/truetype/TiroGurmukhi-Regular.ttf
     install -Dm644 TiroGurmukhi-Italic.ttf $out/share/fonts/truetype/TiroGurmukhi-Italic.ttf
  '';

  meta = with lib; {
    description = "Tiro Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
