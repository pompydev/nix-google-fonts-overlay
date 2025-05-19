{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "palette-mosaic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/palettemosaic/PaletteMosaic-Regular.ttf?raw=true";
      name = "PaletteMosaic-Regular.ttf";
      sha256 = "6029de6a94670695b620b3df665794e3dae213d8b7aed8ac0327b2da5679b004";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PaletteMosaic-Regular.ttf $out/share/fonts/truetype/PaletteMosaic-Regular.ttf
  '';

  meta = with lib; {
    description = "Palette Mosaic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
