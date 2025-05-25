{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "monda-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/monda/Monda%5Bwght%5D.ttf?raw=true";
      name = "Monda_wght_.ttf";
      sha256 = "c95b63f7612df912adc262cb0ef3e8a6c3e6022beb279d9c2ca01c557aa94b59";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Monda_wght_.ttf $out/share/fonts/truetype/Monda_wght_.ttf
  '';

  meta = with lib; {
    description = "Monda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
