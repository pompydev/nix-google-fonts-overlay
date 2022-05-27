{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "genos-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/200bfba5e1471dec3ecd03b1f71626e9acdf5d34/ofl/genos/Genos%5Bwght%5D.ttf?raw=true";
      name = "Genos_wght_.ttf";
      sha256 = "88a32589d9d8615ab728977d647f5e5010dbf789050d4cf25d6607b14d49a1f1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/200bfba5e1471dec3ecd03b1f71626e9acdf5d34/ofl/genos/Genos-Italic%5Bwght%5D.ttf?raw=true";
      name = "Genos-Italic_wght_.ttf";
      sha256 = "88591d5374bc8ec1d7e4e1151f0289bd00a71903a52a380379491afd730a773e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Genos_wght_.ttf $out/share/fonts/truetype/Genos_wght_.ttf
     install -Dm644 Genos-Italic_wght_.ttf $out/share/fonts/truetype/Genos-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Genos";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
