{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "funnel-display-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/funneldisplay/FunnelDisplay%5Bwght%5D.ttf?raw=true";
      name = "FunnelDisplay_wght_.ttf";
      sha256 = "b4151c9c4b7b07eb74320096b4ff4156cca8821f5adfab34af9fd9a2d6c1179d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FunnelDisplay_wght_.ttf $out/share/fonts/truetype/FunnelDisplay_wght_.ttf
  '';

  meta = with lib; {
    description = "Funnel Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
