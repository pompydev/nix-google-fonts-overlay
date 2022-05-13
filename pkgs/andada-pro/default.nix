{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "andada-pro-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4898fcbdc1ae6fddefcaf37c3fc7e7e331467373/ofl/andadapro/AndadaPro[wght].ttf?raw=true";
      name = "AndadaPro[wght].ttf";
      sha256 = "4f378349c5e7a6c0e6d93ff3cba92a2ecf2217407a0b633ab6ac807c80ab20a3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4898fcbdc1ae6fddefcaf37c3fc7e7e331467373/ofl/andadapro/AndadaPro-Italic[wght].ttf?raw=true";
      name = "AndadaPro-Italic[wght].ttf";
      sha256 = "8544abeadeeda80d70201f444621678ede1aeb140a96d26cd7113bda771ef831";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AndadaPro[wght].ttf' $out/share/fonts/truetype/'AndadaPro[wght].ttf'
     install -Dm644 'AndadaPro-Italic[wght].ttf' $out/share/fonts/truetype/'AndadaPro-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Andada Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
