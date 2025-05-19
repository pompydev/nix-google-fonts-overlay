{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sixtyfour-convergence-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sixtyfourconvergence/SixtyfourConvergence%5BBLED,SCAN,XELA,YELA%5D.ttf?raw=true";
      name = "SixtyfourConvergence_BLED,SCAN,XELA,YELA_.ttf";
      sha256 = "aa8c653e04d6211debe5f5d1b7e851a64345a61b2a3c0a5a295cddb0f1e71688";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SixtyfourConvergence_BLED,SCAN,XELA,YELA_.ttf $out/share/fonts/truetype/SixtyfourConvergence_BLED,SCAN,XELA,YELA_.ttf
  '';

  meta = with lib; {
    description = "Sixtyfour Convergence";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
