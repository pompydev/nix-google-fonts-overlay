{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arbutus-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/arbutus/Arbutus-Regular.ttf?raw=true";
      name = "Arbutus-Regular.ttf";
      sha256 = "6c86e8b86c9eebcdb963f83b382e5ba92764b34c53cd9dd96a00ec5d3c5acfdb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arbutus-Regular.ttf $out/share/fonts/truetype/Arbutus-Regular.ttf
  '';

  meta = with lib; {
    description = "Arbutus";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
