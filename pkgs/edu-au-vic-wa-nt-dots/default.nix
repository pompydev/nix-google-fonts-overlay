{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-dots-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eduauvicwantdots/EduAUVICWANTDots%5Bwght%5D.ttf?raw=true";
      name = "EduAUVICWANTDots_wght_.ttf";
      sha256 = "4be8bf2aa8f4635ceb0d978a2588706e4d12e5c695fa0b8fe1df49b7274317af";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduAUVICWANTDots_wght_.ttf $out/share/fonts/truetype/EduAUVICWANTDots_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu AU VIC WA NT Dots";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
