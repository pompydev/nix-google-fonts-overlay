{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "salsa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/salsa/Salsa-Regular.ttf?raw=true";
      name = "Salsa-Regular.ttf";
      sha256 = "3e69c0731a5104d4f25477aa2cdf9d7e9c54b201c60e99c37380ebd05097930c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Salsa-Regular.ttf $out/share/fonts/truetype/Salsa-Regular.ttf
  '';

  meta = with lib; {
    description = "Salsa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
