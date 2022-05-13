{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-tamil-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/33962261d91437c9a3a04eb32763631c8dec1c81/ofl/anektamil/AnekTamil[wdth,wght].ttf?raw=true";
      name = "AnekTamil[wdth,wght].ttf";
      sha256 = "4b2bb7d91a001180b88862177ef2901e027e6428dec7f8e269413db51f550013";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AnekTamil[wdth,wght].ttf' $out/share/fonts/truetype/'AnekTamil[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Anek Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
