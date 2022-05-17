{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rokkitt-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/990aa67659702681deea9b98db0a3b69658ccef4/ofl/rokkitt/Rokkitt%5Bwght%5D.ttf?raw=true";
      name = "Rokkitt_wght_.ttf";
      sha256 = "9b40356f9bb233c7bd0626ae9d4798a1871ecb410b7c833a6f61be60276b7558";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rokkitt_wght_.ttf $out/share/fonts/truetype/Rokkitt_wght_.ttf
  '';

  meta = with lib; {
    description = "Rokkitt";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
