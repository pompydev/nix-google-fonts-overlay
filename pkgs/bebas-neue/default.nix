{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bebas-neue-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bebasneue/BebasNeue-Regular.ttf?raw=true";
      name = "BebasNeue-Regular.ttf";
      sha256 = "08e4623805102d819f58601e46e345648846075e363b2ceb23313c2d1c83ec73";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BebasNeue-Regular.ttf $out/share/fonts/truetype/BebasNeue-Regular.ttf
  '';

  meta = with lib; {
    description = "Bebas Neue";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
