{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pirata-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pirataone/PirataOne-Regular.ttf?raw=true";
      name = "PirataOne-Regular.ttf";
      sha256 = "5347a2e155589ecf667d4b766613c8ee003edde9f83717fd24c09599a4b1ecc0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PirataOne-Regular.ttf $out/share/fonts/truetype/PirataOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Pirata One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
