{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredoka-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fredoka/Fredoka%5Bwdth,wght%5D.ttf?raw=true";
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
     install -Dm644 Fredoka_wdth-wght_.ttf $out/share/fonts/truetype/Fredoka_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Fredoka";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
