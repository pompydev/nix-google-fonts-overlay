{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "matemasie-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/matemasie/Matemasie-Regular.ttf?raw=true";
      name = "Matemasie-Regular.ttf";
      sha256 = "5ad4d54e1216448e4acf6044bf3a2a1d36e955cd8dea61e9146e8dfc8f1f5cc7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Matemasie-Regular.ttf $out/share/fonts/truetype/Matemasie-Regular.ttf
  '';

  meta = with lib; {
    description = "Matemasie";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
