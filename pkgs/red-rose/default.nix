{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-rose-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redrose/RedRose%5Bwght%5D.ttf?raw=true";
      name = "RedRose_wght_.ttf";
      sha256 = "e2811a5215647a881cf9e84c030cd81c7b452a99e567652f8531e877d7ae86da";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedRose_wght_.ttf $out/share/fonts/truetype/RedRose_wght_.ttf
  '';

  meta = with lib; {
    description = "Red Rose";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
