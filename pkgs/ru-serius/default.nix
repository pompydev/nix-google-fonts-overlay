{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ru-serius-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3e1eb73a7d0713c0ec502f7738184e10e727c1ef/ofl/ruserius/RUSerius-Regular.ttf?raw=true";
      name = "RUSerius-Regular.ttf";
      sha256 = "52423960a737829ebc851a18fb6362b8cf45ee0e2c1396706ca1a1ca2a0590fd";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RUSerius-Regular.ttf $out/share/fonts/truetype/RUSerius-Regular.ttf
  '';

  meta = with lib; {
    description = "RU Serius";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
