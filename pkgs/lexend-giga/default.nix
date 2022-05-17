{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-giga-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexendgiga/LexendGiga%5Bwght%5D.ttf?raw=true";
      name = "LexendGiga_wght_.ttf";
      sha256 = "a62c958e898995a2177f9683e3dad2a8da98b571a04601a15b4b2c4bb390c6f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LexendGiga_wght_.ttf $out/share/fonts/truetype/LexendGiga_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend Giga";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
