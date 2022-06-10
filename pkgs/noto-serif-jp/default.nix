{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-jp-${version}";
  version = "2022-06-08-123023";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a27016c0db1ca8449de5f960ddf1406b327f3c67/ofl/notoserifjp/NotoSerifJP%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifJP_wght_.ttf";
      sha256 = "4c6b4670b73d0843c7b2d30b9e2fbcfa596aef6fd3937f894929ab0b8d659d1e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifJP_wght_.ttf $out/share/fonts/truetype/NotoSerifJP_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif JP";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
