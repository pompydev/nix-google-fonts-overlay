{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "m-plus-code-latin-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cc7c9d1136ffad9e89319aa3b8045d985f6ea223/ofl/mpluscodelatin/MPLUSCodeLatin[wdth,wght].ttf?raw=true";
      name = "MPLUSCodeLatin[wdth,wght].ttf";
      sha256 = "c755d11b372d7e2ed1f7a10640c6ff3a473c666b4a8e0b4f809e40e7d4b4c5f5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'MPLUSCodeLatin[wdth,wght].ttf' $out/share/fonts/truetype/'MPLUSCodeLatin[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "M PLUS Code Latin";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
