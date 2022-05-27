{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tapestry-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f69bd2f8a19b3a00fb92c03c8f154fd25d4222b3/ofl/tapestry/Tapestry-Regular.ttf?raw=true";
      name = "Tapestry-Regular.ttf";
      sha256 = "1434a2e7ba36fb5266a8ef7889eb4e873b64b58007e89c00caf5802cabdfff6f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tapestry-Regular.ttf $out/share/fonts/truetype/Tapestry-Regular.ttf
  '';

  meta = with lib; {
    description = "Tapestry";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
