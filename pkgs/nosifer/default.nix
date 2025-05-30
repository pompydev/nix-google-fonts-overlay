{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nosifer-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/nosifer/Nosifer-Regular.ttf?raw=true";
      name = "Nosifer-Regular.ttf";
      sha256 = "09c5ac35e34dc7a397d5f698b703c5640b59cf93d4d343ebae4f16f3859d09b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nosifer-Regular.ttf $out/share/fonts/truetype/Nosifer-Regular.ttf
  '';

  meta = with lib; {
    description = "Nosifer";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
