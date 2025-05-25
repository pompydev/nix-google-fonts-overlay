{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ojuju-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ojuju/Ojuju%5Bwght%5D.ttf?raw=true";
      name = "Ojuju_wght_.ttf";
      sha256 = "6a4eae3adcf726e5a3961fa6843d5cb4fae3b08726c58fc143e9c2ca5c3d5b52";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ojuju_wght_.ttf $out/share/fonts/truetype/Ojuju_wght_.ttf
  '';

  meta = with lib; {
    description = "Ojuju";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
