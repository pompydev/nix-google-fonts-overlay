{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anuphan-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/anuphan/Anuphan%5Bwght%5D.ttf?raw=true";
      name = "Anuphan_wght_.ttf";
      sha256 = "7ec47ebcaa9d6459d974691cbb42fae52e1449478a607b071bfaf3ccdb433ce4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anuphan_wght_.ttf $out/share/fonts/truetype/Anuphan_wght_.ttf
  '';

  meta = with lib; {
    description = "Anuphan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
