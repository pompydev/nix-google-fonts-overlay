{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-tas-beginner-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/edutasbeginner/EduTASBeginner%5Bwght%5D.ttf?raw=true";
      name = "EduTASBeginner_wght_.ttf";
      sha256 = "17dc8a4e3e38442bd86e4bffbe34819b156cc64b9375057d21b3d0fbc3546ac6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduTASBeginner_wght_.ttf $out/share/fonts/truetype/EduTASBeginner_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu TAS Beginner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
