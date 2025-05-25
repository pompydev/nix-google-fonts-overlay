{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-extended-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/librebarcode39extended/LibreBarcode39Extended-Regular.ttf?raw=true";
      name = "LibreBarcode39Extended-Regular.ttf";
      sha256 = "4fd24568bda30f28cf430f5a9ba2aa3fcce3677e08f306edf30ab42fd6187535";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39Extended-Regular.ttf $out/share/fonts/truetype/LibreBarcode39Extended-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39 Extended";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
