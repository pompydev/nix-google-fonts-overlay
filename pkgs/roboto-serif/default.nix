{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "roboto-serif-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a84cf0f0bb7f869fbfe664b0014f17176537417d/ofl/robotoserif/RobotoSerif[GRAD,opsz,wdth,wght].ttf?raw=true";
      name = "RobotoSerif_GRAD,opsz,wdth,wght_.ttf";
      sha256 = "2e4ea0467fdb230d725d652cac5ffec22f4c33edfcf48594800628506c32ec85";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a84cf0f0bb7f869fbfe664b0014f17176537417d/ofl/robotoserif/RobotoSerif-Italic[GRAD,opsz,wdth,wght].ttf?raw=true";
      name = "RobotoSerif-Italic_GRAD,opsz,wdth,wght_.ttf";
      sha256 = "3ddd86bc67f6e865f1e2bf2303bb95149b7869f5d064e4eb34e7cb3b8103c2bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RobotoSerif_GRAD,opsz,wdth,wght_.ttf $out/share/fonts/truetype/RobotoSerif_GRAD,opsz,wdth,wght_.ttf
     install -Dm644 RobotoSerif-Italic_GRAD,opsz,wdth,wght_.ttf $out/share/fonts/truetype/RobotoSerif-Italic_GRAD,opsz,wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Roboto Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
