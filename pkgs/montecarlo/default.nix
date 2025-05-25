{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montecarlo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/montecarlo/MonteCarlo-Regular.ttf?raw=true";
      name = "MonteCarlo-Regular.ttf";
      sha256 = "11d397212722b5ddd1e3190c3812139035e7acffb01da8ceaec96eaf985e12b5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MonteCarlo-Regular.ttf $out/share/fonts/truetype/MonteCarlo-Regular.ttf
  '';

  meta = with lib; {
    description = "MonteCarlo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
