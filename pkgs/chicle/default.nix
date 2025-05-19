{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chicle-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chicle/Chicle-Regular.ttf?raw=true";
      name = "Chicle-Regular.ttf";
      sha256 = "2c82494b86d3f03821284d60f2209a33218adde0dad7133ce3eb063b4363372b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Chicle-Regular.ttf $out/share/fonts/truetype/Chicle-Regular.ttf
  '';

  meta = with lib; {
    description = "Chicle";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
