{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "open-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57311b5baf175fa1bdbf055d5ccb50e53d19e745/ofl/opensans/OpenSans[wdth,wght].ttf?raw=true";
      name = "OpenSans[wdth,wght].ttf";
      sha256 = "aaa9bda12706b5ac4c1e7f937c83725f499806113a2672a4e7883a86fc26f4cc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/57311b5baf175fa1bdbf055d5ccb50e53d19e745/ofl/opensans/OpenSans-Italic[wdth,wght].ttf?raw=true";
      name = "OpenSans-Italic[wdth,wght].ttf";
      sha256 = "08ad5582b365272ad5c9eac7cd332a71f6f2bef2c69351d1ba072c50f6049753";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'OpenSans[wdth,wght].ttf' $out/share/fonts/truetype/'OpenSans[wdth,wght].ttf'
     install -Dm644 'OpenSans-Italic[wdth,wght].ttf' $out/share/fonts/truetype/'OpenSans-Italic[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Open Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
