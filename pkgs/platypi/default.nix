{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "platypi-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/platypi/Platypi%5Bwght%5D.ttf?raw=true";
      name = "Platypi_wght_.ttf";
      sha256 = "c4a2f2525bd0deaed25ccca4e0be42d5dcbf2a4739e2cc32fe3e7603333b7d53";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/platypi/Platypi-Italic%5Bwght%5D.ttf?raw=true";
      name = "Platypi-Italic_wght_.ttf";
      sha256 = "716b546cb067982720d2db8327da4921ca32c07206d036b59def8cff6a00f537";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Platypi_wght_.ttf $out/share/fonts/truetype/Platypi_wght_.ttf
     install -Dm644 Platypi-Italic_wght_.ttf $out/share/fonts/truetype/Platypi-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Platypi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
