{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pirata-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pirataone/PirataOne-Regular.ttf?raw=true";
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
