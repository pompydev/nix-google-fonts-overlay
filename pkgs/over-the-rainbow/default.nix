{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "over-the-rainbow-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/overtherainbow/OvertheRainbow.ttf?raw=true";
      name = "OvertheRainbow.ttf";
      sha256 = "62a232ccaa3f1a0b575947a88d1355c5e4c55f5e0ce65307ab91ea958915c3d3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 OvertheRainbow.ttf $out/share/fonts/truetype/OvertheRainbow.ttf
  '';

  meta = with lib; {
    description = "Over the Rainbow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
