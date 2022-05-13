{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "genos-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/200bfba5e1471dec3ecd03b1f71626e9acdf5d34/ofl/genos/Genos[wght].ttf?raw=true";
      name = "Genos[wght].ttf";
      sha256 = "88a32589d9d8615ab728977d647f5e5010dbf789050d4cf25d6607b14d49a1f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/200bfba5e1471dec3ecd03b1f71626e9acdf5d34/ofl/genos/Genos-Italic[wght].ttf?raw=true";
      name = "Genos-Italic[wght].ttf";
      sha256 = "88591d5374bc8ec1d7e4e1151f0289bd00a71903a52a380379491afd730a773e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Genos[wght].ttf' $out/share/fonts/truetype/'Genos[wght].ttf'
     install -Dm644 'Genos-Italic[wght].ttf' $out/share/fonts/truetype/'Genos-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Genos";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
