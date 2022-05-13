{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merriweather-sans-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1bb0a09c37a49e57c3794d2db0c8e82f53c063fc/ofl/merriweathersans/MerriweatherSans[wght].ttf?raw=true";
      name = "MerriweatherSans[wght].ttf";
      sha256 = "bef90d227eeb5b58e27d0a421df6c5d8df2e6a6d68aa08bdc51faa54f1d997dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1bb0a09c37a49e57c3794d2db0c8e82f53c063fc/ofl/merriweathersans/MerriweatherSans-Italic[wght].ttf?raw=true";
      name = "MerriweatherSans-Italic[wght].ttf";
      sha256 = "882e6763fa1f35dc03cd61c1e3186dba2408828c807895dfa16875b1242ad59d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MerriweatherSans[wght].ttf' $out/share/fonts/truetype/'MerriweatherSans[wght].ttf'
     install -Dm644 'MerriweatherSans-Italic[wght].ttf' $out/share/fonts/truetype/'MerriweatherSans-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Merriweather Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
