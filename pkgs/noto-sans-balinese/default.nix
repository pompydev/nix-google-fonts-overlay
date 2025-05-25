{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-balinese-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/notosansbalinese/NotoSansBalinese%5Bwght%5D.ttf?raw=true";
      name = "NotoSansBalinese_wght_.ttf";
      sha256 = "ccca9d3492b86930d8e0272d1e06d9e2e11147489b04d9858aa58e766cc30374";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansBalinese_wght_.ttf $out/share/fonts/truetype/NotoSansBalinese_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Balinese";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
