{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "loved-by-the-king-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lovedbytheking/LovedbytheKing.ttf?raw=true";
      name = "LovedbytheKing.ttf";
      sha256 = "1d2fce705c902a0c47264992e698ce76336013458f0612cc68917025ca6fcfb3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LovedbytheKing.ttf $out/share/fonts/truetype/LovedbytheKing.ttf
  '';

  meta = with lib; {
    description = "Loved by the King";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
