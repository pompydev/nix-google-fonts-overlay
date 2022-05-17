{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kufam-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/537ba8a1da30d3ad7cc0861044330ba2a50951f9/ofl/kufam/Kufam[wght].ttf?raw=true";
      name = "Kufam_wght_.ttf";
      sha256 = "f17a89b518c833de289598d0662bb9a07d09cc7d75b7079a15f1305f624bbcda";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/537ba8a1da30d3ad7cc0861044330ba2a50951f9/ofl/kufam/Kufam-Italic[wght].ttf?raw=true";
      name = "Kufam-Italic_wght_.ttf";
      sha256 = "37c5cf29cb515099783461051cf2c927fc18605b3e7e0088f9bd2150aed756a9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kufam_wght_.ttf $out/share/fonts/truetype/Kufam_wght_.ttf
     install -Dm644 Kufam-Italic_wght_.ttf $out/share/fonts/truetype/Kufam-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Kufam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
