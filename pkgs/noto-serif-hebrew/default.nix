{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-hebrew-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notoserifhebrew/NotoSerifHebrew%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifHebrew_wdth,wght_.ttf";
      sha256 = "93caef921360788dc3b0e32136bb26f16bc57717ec482d48fc7fd43820617165";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifHebrew_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifHebrew_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
