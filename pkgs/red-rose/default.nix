{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-rose-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4353cd55d4f52c24efdc9ab416b82cb2aa85ee44/ofl/redrose/RedRose%5Bwght%5D.ttf?raw=true";
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
