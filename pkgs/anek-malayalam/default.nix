{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-malayalam-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anekmalayalam/AnekMalayalam%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekMalayalam_wdth,wght_.ttf";
      sha256 = "319ccd3dc61afce2a5f2e5f3ce16f555c1f385390e80d12af7b9d017dd4993fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekMalayalam_wdth-wght_.ttf $out/share/fonts/truetype/AnekMalayalam_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Malayalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
