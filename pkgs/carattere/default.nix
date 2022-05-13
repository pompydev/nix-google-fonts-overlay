{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carattere-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/08c5eb1bd59bd9acc8363e14b10da92a319db4e3/ofl/carattere/Carattere-Regular.ttf?raw=true";
      name = "Carattere-Regular.ttf";
      sha256 = "2ee075b50a75aeaea0d976d916b535fbcd423a684e97fe8536fd8f9efe905ae6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Carattere-Regular.ttf $out/share/fonts/truetype/Carattere-Regular.ttf
  '';

  meta = with lib; {
    description = "Carattere";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
