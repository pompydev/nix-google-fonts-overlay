{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gamja-flower-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gamjaflower/GamjaFlower-Regular.ttf?raw=true";
      name = "GamjaFlower-Regular.ttf";
      sha256 = "ece32819ed58536355a49a095b0cdfdd3b8ef9081c5ed9ca1cef8f5d999ae1ac";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GamjaFlower-Regular.ttf $out/share/fonts/truetype/GamjaFlower-Regular.ttf
  '';

  meta = with lib; {
    description = "Gamja Flower";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
