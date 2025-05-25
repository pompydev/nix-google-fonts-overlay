{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tourney-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tourney/Tourney%5Bwdth,wght%5D.ttf?raw=true";
      name = "Tourney_wdth,wght_.ttf";
      sha256 = "ee686a1a657ca9397d4d1e9ba3ada1c10a5d9b6da53aeb94411cd62b1b793377";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tourney/Tourney-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "Tourney-Italic_wdth,wght_.ttf";
      sha256 = "038c789a1ec5be0e935b8a7ad7de6cec7bd0ed8e54cd82f2c95478f54b0744ce";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tourney_wdth-wght_.ttf $out/share/fonts/truetype/Tourney_wdth-wght_.ttf
     install -Dm644 Tourney-Italic_wdth-wght_.ttf $out/share/fonts/truetype/Tourney-Italic_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Tourney";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
