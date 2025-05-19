{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sedgwick-ave-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sedgwickave/SedgwickAve-Regular.ttf?raw=true";
      name = "SedgwickAve-Regular.ttf";
      sha256 = "9c3633e56a8a104e0d10debb70907b66bb3cf32b03137fae7d5392712b253efa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SedgwickAve-Regular.ttf $out/share/fonts/truetype/SedgwickAve-Regular.ttf
  '';

  meta = with lib; {
    description = "Sedgwick Ave";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
