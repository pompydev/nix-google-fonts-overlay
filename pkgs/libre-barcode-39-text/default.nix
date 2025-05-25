{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-text-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/librebarcode39text/LibreBarcode39Text-Regular.ttf?raw=true";
      name = "LibreBarcode39Text-Regular.ttf";
      sha256 = "06ffe0f72409b2912673e2d00b488e4a874bda5d7845ecb5713bbc9d091483af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39Text-Regular.ttf $out/share/fonts/truetype/LibreBarcode39Text-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39 Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
