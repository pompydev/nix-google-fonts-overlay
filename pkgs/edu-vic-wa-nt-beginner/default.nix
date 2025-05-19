{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-vic-wa-nt-beginner-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/eduvicwantbeginner/EduVICWANTBeginner%5Bwght%5D.ttf?raw=true";
      name = "EduVICWANTBeginner_wght_.ttf";
      sha256 = "b5cbf509d245c56f0a42caa7fed8a8661ad5927d76d88bb2008c9037209154b3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduVICWANTBeginner_wght_.ttf $out/share/fonts/truetype/EduVICWANTBeginner_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu VIC WA NT Beginner";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
