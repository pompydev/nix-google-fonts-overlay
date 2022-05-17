{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gwendolyn-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/306bf7bfc6f88940f5c8c23d7a6b5cdcc7db5bc6/ofl/gwendolyn/Gwendolyn-Regular.ttf?raw=true";
      name = "Gwendolyn-Regular.ttf";
      sha256 = "81f114a0ffa9ae461fa84edc90f0ff502b4c7c0aefe6d4e842fff478214a62fc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/306bf7bfc6f88940f5c8c23d7a6b5cdcc7db5bc6/ofl/gwendolyn/Gwendolyn-Bold.ttf?raw=true";
      name = "Gwendolyn-Bold.ttf";
      sha256 = "de7cd081e615049aa4b8b4cf2b6fc70ab70e6a7ba7b2c49853a7f296de141c40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gwendolyn-Regular.ttf $out/share/fonts/truetype/Gwendolyn-Regular.ttf
     install -Dm644 Gwendolyn-Bold.ttf $out/share/fonts/truetype/Gwendolyn-Bold.ttf
  '';

  meta = with lib; {
    description = "Gwendolyn";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
