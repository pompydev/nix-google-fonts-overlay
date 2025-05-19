{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gungsuhche-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gungsuhche/GungsuhChe-Regular.ttf?raw=true";
      name = "GungsuhChe-Regular.ttf";
      sha256 = "ad7744ead7cb467fa12ffc565d1ba864a1a2f972c1bea1e3208062c369982c64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GungsuhChe-Regular.ttf $out/share/fonts/truetype/GungsuhChe-Regular.ttf
  '';

  meta = with lib; {
    description = "GungsuhChe";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
