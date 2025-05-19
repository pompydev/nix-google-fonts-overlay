{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-pre-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/eduauvicwantpre/EduAUVICWANTPre%5Bwght%5D.ttf?raw=true";
      name = "EduAUVICWANTPre_wght_.ttf";
      sha256 = "973adafba66b6df689ba134e53715ae1cb97b74a6b8f9c1bc58394052a415f52";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduAUVICWANTPre_wght_.ttf $out/share/fonts/truetype/EduAUVICWANTPre_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu AU VIC WA NT Pre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
