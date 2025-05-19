{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "staatliches-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/staatliches/Staatliches-Regular.ttf?raw=true";
      name = "Staatliches-Regular.ttf";
      sha256 = "8395212aa4c6c3534bd39a745d956305ff080c3f3ed73ba61e4fbaae951e55cc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Staatliches-Regular.ttf $out/share/fonts/truetype/Staatliches-Regular.ttf
  '';

  meta = with lib; {
    description = "Staatliches";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
