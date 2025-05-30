{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "galada-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/galada/Galada-Regular.ttf?raw=true";
      name = "Galada-Regular.ttf";
      sha256 = "acc22b41ee470dc542e15b5f8907c7fbebef1b9c01eb20e4127bdbf052b006ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Galada-Regular.ttf $out/share/fonts/truetype/Galada-Regular.ttf
  '';

  meta = with lib; {
    description = "Galada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
