{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pavanam-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pavanam/Pavanam-Regular.ttf?raw=true";
      name = "Pavanam-Regular.ttf";
      sha256 = "d2805bfdca57f7d7a0c69edf35a5f98d4605af6603dcca943db5d11ea531c2f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Pavanam-Regular.ttf $out/share/fonts/truetype/Pavanam-Regular.ttf
  '';

  meta = with lib; {
    description = "Pavanam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
