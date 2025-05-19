{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-39-extended-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebarcode39extendedtext/LibreBarcode39ExtendedText-Regular.ttf?raw=true";
      name = "LibreBarcode39ExtendedText-Regular.ttf";
      sha256 = "d7b50101f16c4dc3eae0bd1bab254c1fda6b69a1396db72b1767be229a0cec2b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode39ExtendedText-Regular.ttf $out/share/fonts/truetype/LibreBarcode39ExtendedText-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 39 Extended Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
