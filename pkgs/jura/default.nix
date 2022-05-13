{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jura-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57ecf341fe3da6601933c290d7415a0f81362146/ofl/jura/Jura[wght].ttf?raw=true";
      name = "Jura[wght].ttf";
      sha256 = "188b415d44810d68b4d6b4a8c281f864184c2b8edc5e88e6357c89f7b44075bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Jura[wght].ttf' $out/share/fonts/truetype/'Jura[wght].ttf'
  '';

  meta = with lib; {
    description = "Jura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
