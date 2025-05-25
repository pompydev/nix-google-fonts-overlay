{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baskervville-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/baskervvillesc/BaskervvilleSC%5Bwght%5D.ttf?raw=true";
      name = "BaskervvilleSC_wght_.ttf";
      sha256 = "cd2ac64e7b75f6c31fcec8b8c85a729f88d6b2987bdc0062d057f06904069304";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BaskervvilleSC_wght_.ttf $out/share/fonts/truetype/BaskervvilleSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Baskervville SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
