{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cherry-bomb-one-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6d254d7517c4970b0bd73f62b77435eee0a21d0f/ofl/cherrybombone/CherryBombOne-Regular.ttf?raw=true";
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
