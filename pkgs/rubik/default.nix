{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/096e136d61e4e0cf9aff11d38eb2cc73c07381b1/ofl/rubik/Rubik[wght].ttf?raw=true";
      name = "Rubik[wght].ttf";
      sha256 = "7243c68abd1b9aee3c4a8143bfd119d72e44fb2eb7d64feef21e86f19f00fc39";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/096e136d61e4e0cf9aff11d38eb2cc73c07381b1/ofl/rubik/Rubik-Italic[wght].ttf?raw=true";
      name = "Rubik-Italic[wght].ttf";
      sha256 = "9e04093c404885c0e5aadccec42471f03c9127c06ff6fd18539b48cf34319038";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Rubik[wght].ttf' $out/share/fonts/truetype/'Rubik[wght].ttf'
     install -Dm644 'Rubik-Italic[wght].ttf' $out/share/fonts/truetype/'Rubik-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Rubik";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
