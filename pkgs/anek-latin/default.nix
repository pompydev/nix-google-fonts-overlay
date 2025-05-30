{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-latin-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/aneklatin/AnekLatin%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekLatin_wdth,wght_.ttf";
      sha256 = "ef7077abf2166add6ab6a64b4a4a4407859bf4f9e5b9058b51ac01ada136b295";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekLatin_wdth-wght_.ttf $out/share/fonts/truetype/AnekLatin_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Latin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
