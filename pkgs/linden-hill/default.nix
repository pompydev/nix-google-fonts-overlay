{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "linden-hill-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lindenhill/LindenHill-Regular.ttf?raw=true";
      name = "LindenHill-Regular.ttf";
      sha256 = "eed3fde6c495dd558b88aa0d3486516dd4d9956a497c335db7beaa9c29d0508a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lindenhill/LindenHill-Italic.ttf?raw=true";
      name = "LindenHill-Italic.ttf";
      sha256 = "6071ebcba53242167cfe38dfd0ae108125055405fb1b4ecd0468e287a9e7c743";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LindenHill-Regular.ttf $out/share/fonts/truetype/LindenHill-Regular.ttf
     install -Dm644 LindenHill-Italic.ttf $out/share/fonts/truetype/LindenHill-Italic.ttf
  '';

  meta = with lib; {
    description = "Linden Hill";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
