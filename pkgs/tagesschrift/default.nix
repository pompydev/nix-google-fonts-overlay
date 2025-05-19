{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tagesschrift-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/tagesschrift/Tagesschrift-Regular.ttf?raw=true";
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
