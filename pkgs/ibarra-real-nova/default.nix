{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibarra-real-nova-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89ade4fa7b7663aec69d3202d2eefd928e78c467/ofl/ibarrarealnova/IbarraRealNova[wght].ttf?raw=true";
      name = "IbarraRealNova[wght].ttf";
      sha256 = "c627ab48daf6544099014b4c5c7faa4e3b993ef5ec77709c89dd37efd4107ddd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/89ade4fa7b7663aec69d3202d2eefd928e78c467/ofl/ibarrarealnova/IbarraRealNova-Italic[wght].ttf?raw=true";
      name = "IbarraRealNova-Italic[wght].ttf";
      sha256 = "2ead710644460a0433998baccda6070207ad819c027cec442489578b580e1f6e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'IbarraRealNova[wght].ttf' $out/share/fonts/truetype/'IbarraRealNova[wght].ttf'
     install -Dm644 'IbarraRealNova-Italic[wght].ttf' $out/share/fonts/truetype/'IbarraRealNova-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Ibarra Real Nova";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
