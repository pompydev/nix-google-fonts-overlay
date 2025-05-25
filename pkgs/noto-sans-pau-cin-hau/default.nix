{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-pau-cin-hau-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosanspaucinhau/NotoSansPauCinHau-Regular.ttf?raw=true";
      name = "NotoSansPauCinHau-Regular.ttf";
      sha256 = "148f6ad11e71c58a4c557af7f492a6478b3e96700202a62e7013dd7031057a83";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansPauCinHau-Regular.ttf $out/share/fonts/truetype/NotoSansPauCinHau-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Pau Cin Hau";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
