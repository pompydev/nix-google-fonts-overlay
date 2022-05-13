{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bodoni-moda-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5cbf0538b9df18080568c5c021a29bd5e36926ec/ofl/bodonimoda/BodoniModa[opsz,wght].ttf?raw=true";
      name = "BodoniModa[opsz,wght].ttf";
      sha256 = "5ae2241d6322ad81786a8b2975a3e317a2a755517eb1be26b6605098960e2e35";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/5cbf0538b9df18080568c5c021a29bd5e36926ec/ofl/bodonimoda/BodoniModa-Italic[opsz,wght].ttf?raw=true";
      name = "BodoniModa-Italic[opsz,wght].ttf";
      sha256 = "af75390c13f6731653ecc135a5f65067c223945edadcc8b40b827d3955959e1b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'BodoniModa[opsz,wght].ttf' $out/share/fonts/truetype/'BodoniModa[opsz,wght].ttf'
     install -Dm644 'BodoniModa-Italic[opsz,wght].ttf' $out/share/fonts/truetype/'BodoniModa-Italic[opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Bodoni Moda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
