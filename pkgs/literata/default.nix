{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "literata-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f7e976afd0935d8fef127fbe92cbcf300913ef4/ofl/literata/Literata%5Bopsz,wght%5D.ttf?raw=true";
      name = "Literata_opsz,wght_.ttf";
      sha256 = "b267914c907470fdfaa28e626fa11366ccec9b1bafa6cd37b1278f27256a61f4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2f7e976afd0935d8fef127fbe92cbcf300913ef4/ofl/literata/Literata-Italic%5Bopsz,wght%5D.ttf?raw=true";
      name = "Literata-Italic_opsz,wght_.ttf";
      sha256 = "913038c9313a9a7d2fdc30ef8a6088defbb106bb2149486fd8cfd9f307884392";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Literata_opsz,wght_.ttf $out/share/fonts/truetype/Literata_opsz,wght_.ttf
     install -Dm644 Literata-Italic_opsz,wght_.ttf $out/share/fonts/truetype/Literata-Italic_opsz,wght_.ttf
  '';

  meta = with lib; {
    description = "Literata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
