{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montecarlo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/montecarlo/MonteCarlo-Regular.ttf?raw=true";
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
