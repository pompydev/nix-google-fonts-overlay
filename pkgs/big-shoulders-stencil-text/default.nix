{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bigshouldersstenciltext/BigShouldersStencilText%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersStencilText_wght_.ttf";
      sha256 = "583e3423e62bb853b4970d7b10d44384d179d86e3e96a0bc54103cfbfb96a122";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersStencilText_wght_.ttf $out/share/fonts/truetype/BigShouldersStencilText_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
