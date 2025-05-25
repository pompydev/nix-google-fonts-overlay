{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alata-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/alata/Alata-Regular.ttf?raw=true";
      name = "Alata-Regular.ttf";
      sha256 = "7b71432a5e2e2409a3583553bc5ce703209a8bce9b2f136ca257ac4c2d3addc4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alata-Regular.ttf $out/share/fonts/truetype/Alata-Regular.ttf
  '';

  meta = with lib; {
    description = "Alata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
