{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kapakana-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89317c42d5be47346f161fcbde8bd196b1596580/ofl/kapakana/Kapakana%5Bwght%5D.ttf?raw=true";
      name = "Kapakana_wght_.ttf";
      sha256 = "5a3cd4c8e88abc776ceb92b5bdf29e61d71ad5d594cae896cb5d5ce571d7fe32";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kapakana_wght_.ttf $out/share/fonts/truetype/Kapakana_wght_.ttf
  '';

  meta = with lib; {
    description = "Kapakana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
