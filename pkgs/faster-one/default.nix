{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "faster-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fasterone/FasterOne-Regular.ttf?raw=true";
      name = "FasterOne-Regular.ttf";
      sha256 = "382877a3a497c42bfeadfbb6e1b939d5b0f3f5cfd6c1a566c0c0d3d1f9b4bcb5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FasterOne-Regular.ttf $out/share/fonts/truetype/FasterOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Faster One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
