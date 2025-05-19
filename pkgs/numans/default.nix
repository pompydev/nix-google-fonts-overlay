{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "numans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/numans/Numans-Regular.ttf?raw=true";
      name = "Numans-Regular.ttf";
      sha256 = "d331ef3473572f5eb0dd05b6de238b65b4d875eb1c5296e18225a7b4e64436f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Numans-Regular.ttf $out/share/fonts/truetype/Numans-Regular.ttf
  '';

  meta = with lib; {
    description = "Numans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
