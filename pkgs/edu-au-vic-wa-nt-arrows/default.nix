{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "edu-au-vic-wa-nt-arrows-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/eduauvicwantarrows/EduAUVICWANTArrows%5Bwght%5D.ttf?raw=true";
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
