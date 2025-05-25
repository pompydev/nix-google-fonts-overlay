{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sixtyfour-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sixtyfour/Sixtyfour%5BBLED,SCAN%5D.ttf?raw=true";
      name = "Sixtyfour_BLED,SCAN_.ttf";
      sha256 = "3d5a3bb3257a491124347bac83ca7f0c8c77a9961270f353b498f3153e751c68";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sixtyfour_BLED-SCAN_.ttf $out/share/fonts/truetype/Sixtyfour_BLED-SCAN_.ttf
  '';

  meta = with lib; {
    description = "Sixtyfour";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
