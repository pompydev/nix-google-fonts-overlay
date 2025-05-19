{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-hand-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/eduauvicwanthand/EduAUVICWANTHand%5Bwght%5D.ttf?raw=true";
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
