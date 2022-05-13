{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-malayalam-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5df45cccfed5dd2d07b7b2a987384bfd76a537f5/ofl/anekmalayalam/AnekMalayalam[wdth,wght].ttf?raw=true";
      name = "AnekMalayalam[wdth,wght].ttf";
      sha256 = "319ccd3dc61afce2a5f2e5f3ce16f555c1f385390e80d12af7b9d017dd4993fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AnekMalayalam[wdth,wght].ttf' $out/share/fonts/truetype/'AnekMalayalam[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Anek Malayalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
