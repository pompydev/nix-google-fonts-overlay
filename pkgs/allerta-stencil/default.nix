{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "allerta-stencil-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/allertastencil/AllertaStencil-Regular.ttf?raw=true";
      name = "AllertaStencil-Regular.ttf";
      sha256 = "8c504d1be20768941ab04251a389ad82d5782d647fa1c4029c811dc5bc2abd59";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AllertaStencil-Regular.ttf $out/share/fonts/truetype/AllertaStencil-Regular.ttf
  '';

  meta = with lib; {
    description = "Allerta Stencil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
