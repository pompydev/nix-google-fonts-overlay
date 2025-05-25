{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tagesschrift-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tagesschrift/Tagesschrift-Regular.ttf?raw=true";
      name = "Tagesschrift-Regular.ttf";
      sha256 = "c8d9506c31912f8151dd98cc23793692552534f21fcdd2d489eb923f4c00dfb7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tagesschrift-Regular.ttf $out/share/fonts/truetype/Tagesschrift-Regular.ttf
  '';

  meta = with lib; {
    description = "Tagesschrift";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
