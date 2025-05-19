{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "madimi-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/madimione/MadimiOne-Regular.ttf?raw=true";
      name = "MadimiOne-Regular.ttf";
      sha256 = "e70355081d3f4eb1fb3d523c4b803a8977669f6ba7c2c14ecee88d2d19fec690";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MadimiOne-Regular.ttf $out/share/fonts/truetype/MadimiOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Madimi One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
