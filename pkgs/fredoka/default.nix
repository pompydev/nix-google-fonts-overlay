{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredoka-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda3fe521878f70de0e2d91fd6d800f93f8c4758/ofl/fredoka/Fredoka[wdth,wght].ttf?raw=true";
      name = "Fredoka[wdth,wght].ttf";
      sha256 = "2ba02e68b152868aef9ba28e24b3648c7d457fe6f25c761f2c2c53fb61a73fc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Fredoka[wdth,wght].ttf' $out/share/fonts/truetype/'Fredoka[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Fredoka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
