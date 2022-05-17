{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "aoboshi-one-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/cf2da3975aefd17b0a95dbd72416665bc9d731fd/ofl/aoboshione/AoboshiOne-Regular.ttf?raw=true";
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
