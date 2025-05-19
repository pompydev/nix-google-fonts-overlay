{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-guides-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/eduauvicwantguides/EduAUVICWANTGuides%5Bwght%5D.ttf?raw=true";
      name = "EduAUVICWANTGuides_wght_.ttf";
      sha256 = "7c47fc85f944c729e9df8af4be787a3c222604916b8700045451a0743cd29d4a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduAUVICWANTGuides_wght_.ttf $out/share/fonts/truetype/EduAUVICWANTGuides_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu AU VIC WA NT Guides";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
