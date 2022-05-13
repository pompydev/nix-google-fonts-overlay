{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-tera-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexendtera/LexendTera[wght].ttf?raw=true";
      name = "LexendTera[wght].ttf";
      sha256 = "153c623deb39a4a79f26972e1a7b61651c16f9d567d4af83be2942303307dfac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'LexendTera[wght].ttf' $out/share/fonts/truetype/'LexendTera[wght].ttf'
  '';

  meta = with lib; {
    description = "Lexend Tera";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
