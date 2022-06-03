{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "finlandica-${version}";
  version = "2022-06-02-123207";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4754c2d98fad2b17587f66972edb18aa3c0658d2/ofl/finlandica/Finlandica%5Bwght%5D.ttf?raw=true";
      name = "Finlandica_wght_.ttf";
      sha256 = "88d3eec4aa204695c0c1434e25e097a9746b2dbbd316f3154acbc9d1c9de003d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4754c2d98fad2b17587f66972edb18aa3c0658d2/ofl/finlandica/Finlandica-Italic%5Bwght%5D.ttf?raw=true";
      name = "Finlandica-Italic_wght_.ttf";
      sha256 = "7c431e56ea162ae263c6f2ed6653e1487a0030735822c7b9561f2fde6a2c15dc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Finlandica_wght_.ttf $out/share/fonts/truetype/Finlandica_wght_.ttf
     install -Dm644 Finlandica-Italic_wght_.ttf $out/share/fonts/truetype/Finlandica-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Finlandica";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
