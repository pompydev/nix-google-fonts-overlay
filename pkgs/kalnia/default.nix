{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kalnia-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/kalnia/Kalnia%5Bwdth,wght%5D.ttf?raw=true";
      name = "Kalnia_wdth,wght_.ttf";
      sha256 = "33685d0ec4abcca2736a51a10a6d4ee1aab2e608e6598c6926af9550b86731a4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kalnia_wdth-wght_.ttf $out/share/fonts/truetype/Kalnia_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Kalnia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
