{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "julee-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/julee/Julee-Regular.ttf?raw=true";
      name = "Julee-Regular.ttf";
      sha256 = "1a895f51fbe0e37f059b1c07030068a2ccbadef8f81970cd346b967bb0b57eb1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Julee-Regular.ttf $out/share/fonts/truetype/Julee-Regular.ttf
  '';

  meta = with lib; {
    description = "Julee";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
