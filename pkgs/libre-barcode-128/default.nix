{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-128-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2c8be09d71050bb386a6264d5cd3d9ee51722dc8/ofl/librebarcode128/LibreBarcode128-Regular.ttf?raw=true";
      name = "LibreBarcode128-Regular.ttf";
      sha256 = "bece6b8695cf29f04ce1c706f0f508a65545f3b6240a03cef302b70f846630a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode128-Regular.ttf $out/share/fonts/truetype/LibreBarcode128-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 128";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
