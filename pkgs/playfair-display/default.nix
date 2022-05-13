{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playfair-display-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1e1aa08e994ff7db50116e86ccc7b52a4e4ae5b8/ofl/playfairdisplay/PlayfairDisplay[wght].ttf?raw=true";
      name = "PlayfairDisplay[wght].ttf";
      sha256 = "c40f2293766a503bc70cce9e512ef844a4ccb7cbcde792fe2ea31d191917d8d6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1e1aa08e994ff7db50116e86ccc7b52a4e4ae5b8/ofl/playfairdisplay/PlayfairDisplay-Italic[wght].ttf?raw=true";
      name = "PlayfairDisplay-Italic[wght].ttf";
      sha256 = "a5e26dc5e2e77fb2803a0bf02fd4f81ee136ec8dea863ccdb0c59a263b21378b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'PlayfairDisplay[wght].ttf' $out/share/fonts/truetype/'PlayfairDisplay[wght].ttf'
     install -Dm644 'PlayfairDisplay-Italic[wght].ttf' $out/share/fonts/truetype/'PlayfairDisplay-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Playfair Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
