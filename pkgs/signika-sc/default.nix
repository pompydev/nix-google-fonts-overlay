{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/signikasc/SignikaSC%5Bwght%5D.ttf?raw=true";
      name = "SignikaSC_wght_.ttf";
      sha256 = "0ffd156ad5600bfe17498effd0c69edc1d6cb09fdbfda1a94f9ceb0f8b403222";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SignikaSC_wght_.ttf $out/share/fonts/truetype/SignikaSC_wght_.ttf
  '';

  meta = with lib; {
    description = "Signika SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
