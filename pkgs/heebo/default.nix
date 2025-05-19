{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "heebo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/heebo/Heebo%5Bwght%5D.ttf?raw=true";
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
