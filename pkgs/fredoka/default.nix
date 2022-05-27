{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredoka-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/eda3fe521878f70de0e2d91fd6d800f93f8c4758/ofl/fredoka/Fredoka%5Bwdth,wght%5D.ttf?raw=true";
      name = "Fredoka_wdth,wght_.ttf";
      sha256 = "2ba02e68b152868aef9ba28e24b3648c7d457fe6f25c761f2c2c53fb61a73fc8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fredoka_wdth,wght_.ttf $out/share/fonts/truetype/Fredoka_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Fredoka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
