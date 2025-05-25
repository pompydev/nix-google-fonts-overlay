{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "square-peg-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/squarepeg/SquarePeg-Regular.ttf?raw=true";
      name = "SquarePeg-Regular.ttf";
      sha256 = "eec103268e16f1f348482687964e5c1545c9c5888052cb48d1aa8dc9f27a37fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SquarePeg-Regular.ttf $out/share/fonts/truetype/SquarePeg-Regular.ttf
  '';

  meta = with lib; {
    description = "Square Peg";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
