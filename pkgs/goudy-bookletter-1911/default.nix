{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "goudy-bookletter-1911-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/goudybookletter1911/GoudyBookletter1911.ttf?raw=true";
      name = "GoudyBookletter1911.ttf";
      sha256 = "62d219942d2e4a3a8473c116254966d308820ae1729e2fac3730e66c073a5548";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GoudyBookletter1911.ttf $out/share/fonts/truetype/GoudyBookletter1911.ttf
  '';

  meta = with lib; {
    description = "Goudy Bookletter 1911";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
