{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "heebo-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/heebo/Heebo%5Bwght%5D.ttf?raw=true";
      name = "Heebo_wght_.ttf";
      sha256 = "18f930b583fa8fe6b40b2f8263b7ac6afbac07adc91a12467874e7467d3ace30";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Heebo_wght_.ttf $out/share/fonts/truetype/Heebo_wght_.ttf
  '';

  meta = with lib; {
    description = "Heebo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
