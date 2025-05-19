{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-128-text-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/librebarcode128text/LibreBarcode128Text-Regular.ttf?raw=true";
      name = "LibreBarcode128Text-Regular.ttf";
      sha256 = "0e8a268749e77c8bf1644a19cdd65e83af6486bcadc06225e486cdf569d58f58";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LibreBarcode128Text-Regular.ttf $out/share/fonts/truetype/LibreBarcode128Text-Regular.ttf
  '';

  meta = with lib; {
    description = "Libre Barcode 128 Text";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
