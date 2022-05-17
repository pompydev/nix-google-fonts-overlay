{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/80874660e59fabe523036a20957a9370fe1230a7/ofl/signika/Signika%5Bwght%5D.ttf?raw=true";
      name = "Signika_wght_.ttf";
      sha256 = "be6b2e7a46a901d483cb9ce5df880a91e63d5e709451bd380051e04ae2c49c89";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Signika_wght_.ttf $out/share/fonts/truetype/Signika_wght_.ttf
  '';

  meta = with lib; {
    description = "Signika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
