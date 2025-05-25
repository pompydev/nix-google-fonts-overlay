{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-barcode-128-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/librebarcode128/LibreBarcode128-Regular.ttf?raw=true";
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
