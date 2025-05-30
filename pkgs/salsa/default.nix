{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "salsa-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/salsa/Salsa-Regular.ttf?raw=true";
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
