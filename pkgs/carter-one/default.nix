{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carter-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/carterone/CarterOne.ttf?raw=true";
      name = "CarterOne.ttf";
      sha256 = "9267b32e571924b5977a3bfb068726603a1eecf2af8dadbc4262e943b53959c8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CarterOne.ttf $out/share/fonts/truetype/CarterOne.ttf
  '';

  meta = with lib; {
    description = "Carter One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
