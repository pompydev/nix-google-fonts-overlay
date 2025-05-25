{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miltonian-tattoo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/miltoniantattoo/MiltonianTattoo-Regular.ttf?raw=true";
      name = "MiltonianTattoo-Regular.ttf";
      sha256 = "b4e9f4c263fc1e7beb14b09572ecb21ba893ce8d5e5cec1e5727c79d5c8583dc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MiltonianTattoo-Regular.ttf $out/share/fonts/truetype/MiltonianTattoo-Regular.ttf
  '';

  meta = with lib; {
    description = "Miltonian Tattoo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
