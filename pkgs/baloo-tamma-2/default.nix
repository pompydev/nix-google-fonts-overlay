{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baloo-tamma-2-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/48be53e8ff974858f33a01c86ded83dba2fd710f/ofl/balootamma2/BalooTamma2[wght].ttf?raw=true";
      name = "BalooTamma2[wght].ttf";
      sha256 = "364e7b33fafe3f94eb121b4db36423e1b0fbef278af0b1a8d3643c65567b9d3c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BalooTamma2[wght].ttf' $out/share/fonts/truetype/'BalooTamma2[wght].ttf'
  '';

  meta = with lib; {
    description = "Baloo Tamma 2";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
