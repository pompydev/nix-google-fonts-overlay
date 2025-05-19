{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jura-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jura/Jura%5Bwght%5D.ttf?raw=true";
      name = "Jura_wght_.ttf";
      sha256 = "188b415d44810d68b4d6b4a8c281f864184c2b8edc5e88e6357c89f7b44075bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jura_wght_.ttf $out/share/fonts/truetype/Jura_wght_.ttf
  '';

  meta = with lib; {
    description = "Jura";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
