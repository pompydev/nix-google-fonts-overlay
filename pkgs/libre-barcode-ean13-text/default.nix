{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-ean13-text-${version}";
  version = "2021-12-12-182943";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90233404dd9c0092de76afe4eccb279277c97e8b/ofl/librebarcodeean13text/LibreBarcodeEAN13Text-Regular.ttf?raw=true";
      name = "LibreBarcodeEAN13Text-Regular.ttf";
      sha256 = "4a7c7c830a98e9dc6896b80e9f6e7bc6ec0a0fab942bc4a4cbe9a29f5bcd3c02";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcodeEAN13Text-Regular.ttf $out/share/fonts/truetype/LibreBarcodeEAN13Text-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode EAN13 Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
