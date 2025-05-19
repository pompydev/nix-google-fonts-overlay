{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "borel-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/borel/Borel-Regular.ttf?raw=true";
      name = "Borel-Regular.ttf";
      sha256 = "a548b566d49f5f88b4bd57ecf6cf677adcff4917cc63a28d0c2d2c0c21309d5c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Borel-Regular.ttf $out/share/fonts/truetype/Borel-Regular.ttf
  '';

  meta = with lib; {
    description = "Borel";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
