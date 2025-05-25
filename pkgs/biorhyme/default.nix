{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biorhyme-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/biorhyme/BioRhyme%5Bwdth,wght%5D.ttf?raw=true";
      name = "BioRhyme_wdth,wght_.ttf";
      sha256 = "3ef9bcf73838d59683b4144ddd4687bc9023340ee8e2bec33bc7b3cead65c9f7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BioRhyme_wdth-wght_.ttf $out/share/fonts/truetype/BioRhyme_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "BioRhyme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
