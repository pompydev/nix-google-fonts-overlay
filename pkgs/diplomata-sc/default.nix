{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "diplomata-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/diplomatasc/DiplomataSC-Regular.ttf?raw=true";
      name = "DiplomataSC-Regular.ttf";
      sha256 = "6c91b299f45463424e26daf5fbbd5f298ad7b2e89f25bee506dd34a6d5297054";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DiplomataSC-Regular.ttf $out/share/fonts/truetype/DiplomataSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Diplomata SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
