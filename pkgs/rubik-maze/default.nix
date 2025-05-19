{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-maze-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikmaze/RubikMaze-Regular.ttf?raw=true";
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
