{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-arrows-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/eduauvicwantarrows/EduAUVICWANTArrows%5Bwght%5D.ttf?raw=true";
      name = "EduAUVICWANTArrows_wght_.ttf";
      sha256 = "adf8176cc45747608c091094612a7e8d3088d4d46dc89acc37df37fb7a561903";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EduAUVICWANTArrows_wght_.ttf $out/share/fonts/truetype/EduAUVICWANTArrows_wght_.ttf
  '';

  meta = with lib; {
    description = "Edu AU VIC WA NT Arrows";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
