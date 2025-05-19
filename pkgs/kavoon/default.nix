{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kavoon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kavoon/Kavoon-Regular.ttf?raw=true";
      name = "Kavoon-Regular.ttf";
      sha256 = "d9600e05c23bba0872171f094cffe98851f52d3ce1d343f1741d32bfcbcdffa2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kavoon-Regular.ttf $out/share/fonts/truetype/Kavoon-Regular.ttf
  '';

  meta = with lib; {
    description = "Kavoon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
