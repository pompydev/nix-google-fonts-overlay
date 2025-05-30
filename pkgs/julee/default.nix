{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "julee-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/julee/Julee-Regular.ttf?raw=true";
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
