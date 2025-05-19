{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tilt-neon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tiltneon/TiltNeon%5BXROT,YROT%5D.ttf?raw=true";
      name = "TiltNeon_XROT,YROT_.ttf";
      sha256 = "c22333dfd1cd14c2a612b36ea1c50ea13e5e9244181e5129a63c944a165823a0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TiltNeon_XROT,YROT_.ttf $out/share/fonts/truetype/TiltNeon_XROT,YROT_.ttf
  '';

  meta = with lib; {
    description = "Tilt Neon";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
