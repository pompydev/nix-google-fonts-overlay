{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-inline-display-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d5baecffa3e9457ce8a7beda09c584b7a16f9415/ofl/bigshouldersinlinedisplay/BigShouldersInlineDisplay[wght].ttf?raw=true";
      name = "BigShouldersInlineDisplay[wght].ttf";
      sha256 = "b0b18de4605db4fb9f8eb54c00e893e80342faa8f0e95b78126474cc32cbdf62";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BigShouldersInlineDisplay[wght].ttf' $out/share/fonts/truetype/'BigShouldersInlineDisplay[wght].ttf'
  '';

  meta = with lib; {
    description = "Big Shoulders Inline Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
