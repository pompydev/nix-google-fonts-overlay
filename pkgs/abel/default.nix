{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "abel-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/abel/Abel-Regular.ttf?raw=true";
      name = "Abel-Regular.ttf";
      sha256 = "8809dcad25318225052f88333e208c5aad4adcb7b2c934c135735ec19aa410b4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Abel-Regular.ttf $out/share/fonts/truetype/Abel-Regular.ttf
  '';

  meta = with lib; {
    description = "Abel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
