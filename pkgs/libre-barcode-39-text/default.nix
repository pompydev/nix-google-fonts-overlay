{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebarcode39text/LibreBarcode39Text-Regular.ttf?raw=true";
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
