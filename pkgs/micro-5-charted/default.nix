{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "micro-5-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/micro5charted/Micro5Charted-Regular.ttf?raw=true";
      name = "Micro5Charted-Regular.ttf";
      sha256 = "7897f7c086e622b7063499eb3202d3f14c8c59c6564d409ad1db17534e289645";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Micro5Charted-Regular.ttf $out/share/fonts/truetype/Micro5Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Micro 5 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
