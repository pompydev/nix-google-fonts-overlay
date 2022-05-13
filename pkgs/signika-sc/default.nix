{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-sc-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c3372cb4bb22eeeea31490983f0d57c5dc69446b/ofl/signikasc/SignikaSC[wght].ttf?raw=true";
      name = "SignikaSC[wght].ttf";
      sha256 = "0ffd156ad5600bfe17498effd0c69edc1d6cb09fdbfda1a94f9ceb0f8b403222";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'SignikaSC[wght].ttf' $out/share/fonts/truetype/'SignikaSC[wght].ttf'
  '';

  meta = with lib; {
    description = "Signika SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
