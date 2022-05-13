{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-128-text-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a6ef91d18f15cf351952c56f8021678f15fc616c/ofl/librebarcode128text/LibreBarcode128Text-Regular.ttf?raw=true";
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
