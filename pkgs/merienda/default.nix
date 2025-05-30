{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merienda-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/merienda/Merienda%5Bwght%5D.ttf?raw=true";
      name = "Merienda_wght_.ttf";
      sha256 = "a91e4d88a50b4f80c7b1f31fe46e376eb87b72247d2a216f5e5be1881340deea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Merienda_wght_.ttf $out/share/fonts/truetype/Merienda_wght_.ttf
  '';

  meta = with lib; {
    description = "Merienda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
