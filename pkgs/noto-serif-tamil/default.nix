{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tamil-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a559a6efcfed22bf50219f52ecefcf20b9522408/ofl/notoseriftamil/NotoSerifTamil[wdth,wght].ttf?raw=true";
      name = "NotoSerifTamil_wdth,wght_.ttf";
      sha256 = "217bf0655e07742d88eaaba8c5ae906adfc41c2930fb881cd9fd936c2cf618ec";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/9b085f82900b7ec74b57bf2d19edddd2f1533111/ofl/notoseriftamil/NotoSerifTamil-Italic[wdth,wght].ttf?raw=true";
      name = "NotoSerifTamil-Italic_wdth,wght_.ttf";
      sha256 = "72e4157c71fcc6e472c6df8f772430ed8dc249f61b0646d046e3fa5dbde26675";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTamil_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifTamil_wdth,wght_.ttf
     install -Dm644 NotoSerifTamil-Italic_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifTamil-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Tamil";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
