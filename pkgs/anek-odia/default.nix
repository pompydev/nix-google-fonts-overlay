{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-odia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anekodia/AnekOdia%5Bwdth,wght%5D.ttf?raw=true";
      name = "AnekOdia_wdth,wght_.ttf";
      sha256 = "673bb6e51b71af1de1f11f9a547a3a58c50a6fa32d480958e1ef0f06980ca45f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AnekOdia_wdth-wght_.ttf $out/share/fonts/truetype/AnekOdia_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Anek Odia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
