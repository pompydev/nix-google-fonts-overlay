{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-zetta-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexendzetta/LexendZetta[wght].ttf?raw=true";
      name = "LexendZetta[wght].ttf";
      sha256 = "705ba2f80f8daf3c93b9aec2798d054e5f31cb1bded00f1706800549f47c35df";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'LexendZetta[wght].ttf' $out/share/fonts/truetype/'LexendZetta[wght].ttf'
  '';

  meta = with lib; {
    description = "Lexend Zetta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
