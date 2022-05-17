{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "orelega-one-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/38c4e065b473adfad469f67fad7fff4d160f7d99/ofl/orelegaone/OrelegaOne-Regular.ttf?raw=true";
      name = "OrelegaOne-Regular.ttf";
      sha256 = "df8372dca68d1a5bc4c7713594ec275d14192f2260b9d5c67c426d300505b704";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OrelegaOne-Regular.ttf $out/share/fonts/truetype/OrelegaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Orelega One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
