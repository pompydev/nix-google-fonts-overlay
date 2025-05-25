{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tapestry-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tapestry/Tapestry-Regular.ttf?raw=true";
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
