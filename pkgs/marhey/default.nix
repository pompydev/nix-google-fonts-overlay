{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "marhey-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/marhey/Marhey%5Bwght%5D.ttf?raw=true";
      name = "Marhey_wght_.ttf";
      sha256 = "19c30686157ec965797fae8c8feb7bb142b082217227562d1a809c067df447e9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Marhey_wght_.ttf $out/share/fonts/truetype/Marhey_wght_.ttf
  '';

  meta = with lib; {
    description = "Marhey";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
