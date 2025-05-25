{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-display-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshouldersinlinedisplaysc/BigShouldersInlineDisplaySC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersInlineDisplaySC_wght_.ttf";
      sha256 = "11c816c179b9fd9cd87b81818f75baf0bd676a498803d07a26fa028d725627af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersInlineDisplaySC_wght_.ttf $out/share/fonts/truetype/BigShouldersInlineDisplaySC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Inline Display SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
