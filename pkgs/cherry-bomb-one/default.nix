{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cherry-bomb-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cherrybombone/CherryBombOne-Regular.ttf?raw=true";
      name = "CherryBombOne-Regular.ttf";
      sha256 = "9596c6793eb0335057d655b13751ce7ccb50ef0cd15cb52c58465fb62de2bb8f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CherryBombOne-Regular.ttf $out/share/fonts/truetype/CherryBombOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Cherry Bomb One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
