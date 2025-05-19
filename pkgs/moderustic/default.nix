{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "moderustic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/moderustic/Moderustic%5Bwght%5D.ttf?raw=true";
      name = "Moderustic_wght_.ttf";
      sha256 = "ba465ae65b26bbc2eede93f05d983912999c0916ef1160449da773fa3beb7467";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Moderustic_wght_.ttf $out/share/fonts/truetype/Moderustic_wght_.ttf
  '';

  meta = with lib; {
    description = "Moderustic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
