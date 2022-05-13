{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-display-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/081d4ba5b9a8dd141d79c1108596876529fd4602/ofl/bigshouldersstencildisplay/BigShouldersStencilDisplay[wght].ttf?raw=true";
      name = "BigShouldersStencilDisplay[wght].ttf";
      sha256 = "93bbefb9f3a497fcfeec5d1ac85c4a947a32b8e5bcaf3b7b5efff52f1b11b0e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BigShouldersStencilDisplay[wght].ttf' $out/share/fonts/truetype/'BigShouldersStencilDisplay[wght].ttf'
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
