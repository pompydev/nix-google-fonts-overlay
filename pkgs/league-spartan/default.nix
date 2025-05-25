{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "league-spartan-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/leaguespartan/LeagueSpartan%5Bwght%5D.ttf?raw=true";
      name = "LeagueSpartan_wght_.ttf";
      sha256 = "2dbb6290b39ab7c48a40b18f74ca59ef48a69a015c3ea0542703f0c6ce51d617";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LeagueSpartan_wght_.ttf $out/share/fonts/truetype/LeagueSpartan_wght_.ttf
  '';

  meta = with lib; {
    description = "League Spartan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
