{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersstencildisplay/BigShouldersStencilDisplay%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersStencilDisplay_wght_.ttf";
      sha256 = "93bbefb9f3a497fcfeec5d1ac85c4a947a32b8e5bcaf3b7b5efff52f1b11b0e4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersStencilDisplay_wght_.ttf $out/share/fonts/truetype/BigShouldersStencilDisplay_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
