{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-display-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersinlinedisplaysc/BigShouldersInlineDisplaySC%5Bwght%5D.ttf?raw=true";
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
