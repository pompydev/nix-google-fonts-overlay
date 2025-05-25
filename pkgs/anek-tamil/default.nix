{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-tamil-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anektamil/AnekTamil%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekTamil_wdth,wght_.ttf";
      sha256 = "4b2bb7d91a001180b88862177ef2901e027e6428dec7f8e269413db51f550013";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekTamil_wdth-wght_.ttf $out/share/fonts/truetype/AnekTamil_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
