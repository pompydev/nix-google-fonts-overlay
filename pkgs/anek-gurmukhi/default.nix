{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anek-gurmukhi-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/315b62b7005991f2723ccb9d789b010ea4a4298f/ofl/anekgurmukhi/AnekGurmukhi[wdth,wght].ttf?raw=true";
      name = "AnekGurmukhi[wdth,wght].ttf";
      sha256 = "40d72129eb332d7c4fafd25e80a30d2ac11f45e14a1660d6f7bacbf9c800d7d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'AnekGurmukhi[wdth,wght].ttf' $out/share/fonts/truetype/'AnekGurmukhi[wdth,wght].ttf'
  '';

  meta = with lib; {
    description = "Anek Gurmukhi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
