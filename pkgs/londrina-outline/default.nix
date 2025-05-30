{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "londrina-outline-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/londrinaoutline/LondrinaOutline-Regular.ttf?raw=true";
      name = "LondrinaOutline-Regular.ttf";
      sha256 = "773c655bc6a2e9b699cfa8c4a5f615c6348686d018281bb8e6cdc470b2f05f4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LondrinaOutline-Regular.ttf $out/share/fonts/truetype/LondrinaOutline-Regular.ttf
  '';

  meta = with lib; {
    description = "Londrina Outline";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
