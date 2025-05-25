{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bahianita-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bahianita/Bahianita-Regular.ttf?raw=true";
      name = "Bahianita-Regular.ttf";
      sha256 = "325f21fc723c962e58f895961c77ed151520baaa56e366c4dcaf7c8fcb75130a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Bahianita-Regular.ttf $out/share/fonts/truetype/Bahianita-Regular.ttf
  '';

  meta = with lib; {
    description = "Bahianita";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
