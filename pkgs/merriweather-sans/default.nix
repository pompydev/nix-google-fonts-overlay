{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "merriweather-sans-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1bb0a09c37a49e57c3794d2db0c8e82f53c063fc/ofl/merriweathersans/MerriweatherSans%5Bwght%5D.ttf?raw=true";
      name = "MerriweatherSans_wght_.ttf";
      sha256 = "bef90d227eeb5b58e27d0a421df6c5d8df2e6a6d68aa08bdc51faa54f1d997dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1bb0a09c37a49e57c3794d2db0c8e82f53c063fc/ofl/merriweathersans/MerriweatherSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "MerriweatherSans-Italic_wght_.ttf";
      sha256 = "882e6763fa1f35dc03cd61c1e3186dba2408828c807895dfa16875b1242ad59d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MerriweatherSans_wght_.ttf $out/share/fonts/truetype/MerriweatherSans_wght_.ttf
     install -Dm644 MerriweatherSans-Italic_wght_.ttf $out/share/fonts/truetype/MerriweatherSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Merriweather Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
