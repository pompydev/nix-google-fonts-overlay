{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stint-ultra-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/stintultracondensed/StintUltraCondensed-Regular.ttf?raw=true";
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
