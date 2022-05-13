{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexend/Lexend[wght].ttf?raw=true";
      name = "Lexend[wght].ttf";
      sha256 = "3add53e641fbc81da64da4bb254285e2831b52b029527bc0714e2b9610832ee6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Lexend[wght].ttf' $out/share/fonts/truetype/'Lexend[wght].ttf'
  '';

  meta = with lib; {
    description = "Lexend";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
