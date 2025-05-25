{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "advent-pro-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/adventpro/AdventPro%5Bwdth,wght%5D.ttf?raw=true";
      name = "AdventPro_wdth,wght_.ttf";
      sha256 = "b60ab2920b89bdc4b7dadfb282cadac6e03833e7a80844f9eac096359b2b9766";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/adventpro/AdventPro-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "AdventPro-Italic_wdth,wght_.ttf";
      sha256 = "0917a5d65589025f2a752b1b0568f924dac49a065a25b4d60116b3c6d4d9ebae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AdventPro_wdth-wght_.ttf $out/share/fonts/truetype/AdventPro_wdth-wght_.ttf
     install -Dm644 AdventPro-Italic_wdth-wght_.ttf $out/share/fonts/truetype/AdventPro-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Advent Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
