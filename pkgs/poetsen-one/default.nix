{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poetsen-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/poetsenone/PoetsenOne-Regular.ttf?raw=true";
      name = "PoetsenOne-Regular.ttf";
      sha256 = "61943821534f3ba438a50e84c6efe90207abc03262fae04b52e4d1dfea3eab26";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PoetsenOne-Regular.ttf $out/share/fonts/truetype/PoetsenOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Poetsen One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
