{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "red-hat-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redhatdisplay/RedHatDisplay%5Bwght%5D.ttf?raw=true";
      name = "RedHatDisplay_wght_.ttf";
      sha256 = "46c9d4c4a2415e7e72020b318f5cda2bcbc9018d78b1a67e480a76d8d6e4b379";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/redhatdisplay/RedHatDisplay-Italic%5Bwght%5D.ttf?raw=true";
      name = "RedHatDisplay-Italic_wght_.ttf";
      sha256 = "6f1e62869decc48f589b022b88b486b1f3f55792618e79f986a6b656c9378a59";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RedHatDisplay_wght_.ttf $out/share/fonts/truetype/RedHatDisplay_wght_.ttf
     install -Dm644 RedHatDisplay-Italic_wght_.ttf $out/share/fonts/truetype/RedHatDisplay-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Red Hat Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
