{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-text-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersstenciltextsc/BigShouldersStencilTextSC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersStencilTextSC_wght_.ttf";
      sha256 = "970efc1f8eb45174ae6fa7e14aa33449af764dc8f925d296e3b9aa1878b87e74";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersStencilTextSC_wght_.ttf $out/share/fonts/truetype/BigShouldersStencilTextSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil Text SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
