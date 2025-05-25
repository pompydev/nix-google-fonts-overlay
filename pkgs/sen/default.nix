{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sen-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sen/Sen%5Bwght%5D.ttf?raw=true";
      name = "Sen_wght_.ttf";
      sha256 = "5a2d5777100be28024b4f28505d678c006bc52e9d9fa78f554a1252b5f254c77";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sen_wght_.ttf $out/share/fonts/truetype/Sen_wght_.ttf
  '';

  meta = with lib; {
    description = "Sen";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
