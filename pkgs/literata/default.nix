{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "literata-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/literata/Literata%5Bopsz,wght%5D.ttf?raw=true";
      name = "Literata_opsz,wght_.ttf";
      sha256 = "b41138c9373112f32abb589cc22e8674b06ed4048b0c513be922bdd26f274440";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/literata/Literata-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "Literata-Italic_opsz,wght_.ttf";
      sha256 = "d483dfaeba9cbf4ce71d32a52ee65df82f7e35b15fff8d1011cdb242d1fcd465";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Literata_opsz-wght_.ttf $out/share/fonts/truetype/Literata_opsz-wght_.ttf
     install -Dm644 Literata-Italic_opsz-wght_.ttf $out/share/fonts/truetype/Literata-Italic_opsz-wght_.ttf
  '';

  meta = with lib; {
    description = "Literata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
