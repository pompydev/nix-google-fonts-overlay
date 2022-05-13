{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montecarlo-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3bad658bbefc87592f4dca3b1c130aa3a13dfddc/ofl/montecarlo/MonteCarlo-Regular.ttf?raw=true";
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
