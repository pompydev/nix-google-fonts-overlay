{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-hand-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eduauvicwanthand/EduAUVICWANTHand%5Bwght%5D.ttf?raw=true";
      name = "EduAUVICWANTHand_wght_.ttf";
      sha256 = "973361e9e538dda39584b3c259e50b1d511a7a9f2ebe46c85b40066126ee6ebc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduAUVICWANTHand_wght_.ttf $out/share/fonts/truetype/EduAUVICWANTHand_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu AU VIC WA NT Hand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
