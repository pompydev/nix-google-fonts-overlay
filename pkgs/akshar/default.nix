{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akshar-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/6dac97888a4878f6f59db268c0f8a336e49a2890/ofl/akshar/Akshar[wght].ttf?raw=true";
      name = "Akshar[wght].ttf";
      sha256 = "cff1ba32b91efffc94474fab787b61cd951f4ac99ce90339b1caa500fa72e890";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Akshar[wght].ttf' $out/share/fonts/truetype/'Akshar[wght].ttf'
  '';

  meta = with lib; {
    description = "Akshar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
