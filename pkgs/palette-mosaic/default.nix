{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "palette-mosaic-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b890c8d44cbdf6800214705ffaf6d83452d2347/ofl/palettemosaic/PaletteMosaic-Regular.ttf?raw=true";
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
