{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "armata-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/armata/Armata-Regular.ttf?raw=true";
      name = "Armata-Regular.ttf";
      sha256 = "ee4a6a0410bafc1d0b46bd4551e5360d4ef7603eea1a9c783d46e9569a936905";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Armata-Regular.ttf $out/share/fonts/truetype/Armata-Regular.ttf
  '';

  meta = with lib; {
    description = "Armata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
