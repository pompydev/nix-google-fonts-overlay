{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "princess-sofia-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/princesssofia/PrincessSofia-Regular.ttf?raw=true";
      name = "PrincessSofia-Regular.ttf";
      sha256 = "2b5df30a7b866cd764cc4ff586dc8c28e16967099d50ab582f003ffbc7228ee5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PrincessSofia-Regular.ttf $out/share/fonts/truetype/PrincessSofia-Regular.ttf
  '';

  meta = with lib; {
    description = "Princess Sofia";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
