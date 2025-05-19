{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aoboshi-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/aoboshione/AoboshiOne-Regular.ttf?raw=true";
      name = "AoboshiOne-Regular.ttf";
      sha256 = "3d197454026eeb34ee409d0d7eda75a8c7ee654a8dfa9c1a73ada2d9e525b7b1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AoboshiOne-Regular.ttf $out/share/fonts/truetype/AoboshiOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Aoboshi One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
