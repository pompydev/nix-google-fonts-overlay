{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "literata-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f7e976afd0935d8fef127fbe92cbcf300913ef4/ofl/literata/Literata[opsz,wght].ttf?raw=true";
      name = "Literata[opsz,wght].ttf";
      sha256 = "b267914c907470fdfaa28e626fa11366ccec9b1bafa6cd37b1278f27256a61f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f7e976afd0935d8fef127fbe92cbcf300913ef4/ofl/literata/Literata-Italic[opsz,wght].ttf?raw=true";
      name = "Literata-Italic[opsz,wght].ttf";
      sha256 = "913038c9313a9a7d2fdc30ef8a6088defbb106bb2149486fd8cfd9f307884392";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Literata[opsz,wght].ttf' $out/share/fonts/truetype/'Literata[opsz,wght].ttf'
     install -Dm644 'Literata-Italic[opsz,wght].ttf' $out/share/fonts/truetype/'Literata-Italic[opsz,wght].ttf'
  '';

  meta = with lib; {
    description = "Literata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
