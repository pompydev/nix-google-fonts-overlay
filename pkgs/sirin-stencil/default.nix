{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sirin-stencil-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sirinstencil/SirinStencil-Regular.ttf?raw=true";
      name = "SirinStencil-Regular.ttf";
      sha256 = "0e231c6220787179588fe8b1c8921bff70207f1f556a6ef7e35e46ae04352b2d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SirinStencil-Regular.ttf $out/share/fonts/truetype/SirinStencil-Regular.ttf
  '';

  meta = with lib; {
    description = "Sirin Stencil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
