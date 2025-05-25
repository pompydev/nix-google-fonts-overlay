{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-maze-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikmaze/RubikMaze-Regular.ttf?raw=true";
      name = "RubikMaze-Regular.ttf";
      sha256 = "5bc4c333e6b5d3caf085d44b633b28a6d2abc40fa933b7bc7a1972ef019ff5d9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMaze-Regular.ttf $out/share/fonts/truetype/RubikMaze-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Maze";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
