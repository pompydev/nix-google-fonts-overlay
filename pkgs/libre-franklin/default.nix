{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "libre-franklin-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bac9b4ad19c8f13b8586908f09c735b528a05b2e/ofl/librefranklin/LibreFranklin[wght].ttf?raw=true";
      name = "LibreFranklin[wght].ttf";
      sha256 = "7625f0843447628c2c263c463a970cf3c53da32af57a37a873ea283f44311dc0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bac9b4ad19c8f13b8586908f09c735b528a05b2e/ofl/librefranklin/LibreFranklin-Italic[wght].ttf?raw=true";
      name = "LibreFranklin-Italic[wght].ttf";
      sha256 = "266bd4859e5b5cbbd1f815ad6bc5d1c425adfb39e287c1adc174d95785845673";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'LibreFranklin[wght].ttf' $out/share/fonts/truetype/'LibreFranklin[wght].ttf'
     install -Dm644 'LibreFranklin-Italic[wght].ttf' $out/share/fonts/truetype/'LibreFranklin-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Libre Franklin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
