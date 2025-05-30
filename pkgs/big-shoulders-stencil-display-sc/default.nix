{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "big-shoulders-stencil-display-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bigshouldersstencildisplaysc/BigShouldersStencilDisplaySC%5Bwght%5D.ttf?raw=true";
      name = "BigShouldersStencilDisplaySC_wght_.ttf";
      sha256 = "42e26acf67c9fcda467a38b63f5a7cd022b55aa96bdc4af249ab8058dd1cc3fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BigShouldersStencilDisplaySC_wght_.ttf $out/share/fonts/truetype/BigShouldersStencilDisplaySC_wght_.ttf
  '';

  meta = with lib; {
    description = "Big Shoulders Stencil Display SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
