{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "readex-pro-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/956ee3203d796c132e1a201fafb02931dab25a04/ofl/readexpro/ReadexPro[wght].ttf?raw=true";
      name = "ReadexPro[wght].ttf";
      sha256 = "bdf57ad5b3477babe9087bda26202cc2f92e1f3910a0ce63d0d6ed6ac74c90f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'ReadexPro[wght].ttf' $out/share/fonts/truetype/'ReadexPro[wght].ttf'
  '';

  meta = with lib; {
    description = "Readex Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
