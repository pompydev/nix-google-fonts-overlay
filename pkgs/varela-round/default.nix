{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "varela-round-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/varelaround/VarelaRound-Regular.ttf?raw=true";
      name = "VarelaRound-Regular.ttf";
      sha256 = "e1e47eb66dbc2ddc106661338e712d9176c9e83c669a82fde155324823d03aa2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VarelaRound-Regular.ttf $out/share/fonts/truetype/VarelaRound-Regular.ttf
  '';

  meta = with lib; {
    description = "Varela Round";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
