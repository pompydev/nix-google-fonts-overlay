{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "madimi-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/madimione/MadimiOne-Regular.ttf?raw=true";
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
