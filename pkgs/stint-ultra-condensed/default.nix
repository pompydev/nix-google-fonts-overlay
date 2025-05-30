{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stint-ultra-condensed-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stintultracondensed/StintUltraCondensed-Regular.ttf?raw=true";
      name = "StintUltraCondensed-Regular.ttf";
      sha256 = "1c32b77a50e960f9e88e29e1c65a0a15ffe277681ace0dbf207fafa7be23591e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 StintUltraCondensed-Regular.ttf $out/share/fonts/truetype/StintUltraCondensed-Regular.ttf
  '';

  meta = with lib; {
    description = "Stint Ultra Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
