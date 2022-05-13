{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bahianita-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/747c13d4ac31f80e050d7c288dccf5f5d80add22/ofl/bahianita/Bahianita-Regular.ttf?raw=true";
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
