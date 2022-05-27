{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-tera-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexendtera/LexendTera%5Bwght%5D.ttf?raw=true";
      name = "LexendTera_wght_.ttf";
      sha256 = "153c623deb39a4a79f26972e1a7b61651c16f9d567d4af83be2942303307dfac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LexendTera_wght_.ttf $out/share/fonts/truetype/LexendTera_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend Tera";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
