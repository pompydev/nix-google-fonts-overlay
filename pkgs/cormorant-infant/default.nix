{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-infant-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantinfant/CormorantInfant%5Bwght%5D.ttf?raw=true";
      name = "CormorantInfant_wght_.ttf";
      sha256 = "48c6efe07539c75d3108795467898706a9cd71ce876d461e45f58482156d7bf3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/cormorantinfant/CormorantInfant-Italic%5Bwght%5D.ttf?raw=true";
      name = "CormorantInfant-Italic_wght_.ttf";
      sha256 = "d5f81edef82cf31c093d057709e1bfb42aa776aacf78651b14f9817c2decb251";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantInfant_wght_.ttf $out/share/fonts/truetype/CormorantInfant_wght_.ttf
     install -Dm644 CormorantInfant-Italic_wght_.ttf $out/share/fonts/truetype/CormorantInfant-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Cormorant Infant";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
