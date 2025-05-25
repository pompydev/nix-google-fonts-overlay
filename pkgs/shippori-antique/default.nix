{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shippori-antique-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/shipporiantique/ShipporiAntique-Regular.ttf?raw=true";
      name = "ShipporiAntique-Regular.ttf";
      sha256 = "b88fd5138c77c1359406051786d45c88ab34e2040c6dfa385f00a4e17edaab52";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ShipporiAntique-Regular.ttf $out/share/fonts/truetype/ShipporiAntique-Regular.ttf
  '';

  meta = with lib; {
    description = "Shippori Antique";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
