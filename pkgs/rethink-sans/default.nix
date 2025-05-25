{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rethink-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rethinksans/RethinkSans%5Bwght%5D.ttf?raw=true";
      name = "RethinkSans_wght_.ttf";
      sha256 = "c700224149f9248587ccb1e1482bb01c1c779076c8c593720838877ad9643347";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rethinksans/RethinkSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "RethinkSans-Italic_wght_.ttf";
      sha256 = "c5f1f9a01cd7b1b5d665aea41332d3cb315d5bb520bc882256238dca9bbcde38";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RethinkSans_wght_.ttf $out/share/fonts/truetype/RethinkSans_wght_.ttf
     install -Dm644 RethinkSans-Italic_wght_.ttf $out/share/fonts/truetype/RethinkSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Rethink Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
