{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gafata-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gafata/Gafata-Regular.ttf?raw=true";
      name = "Gafata-Regular.ttf";
      sha256 = "a816ae1fc683a8c093666b3b7f5de8e8dbdfca658459a484138e65378d4326b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gafata-Regular.ttf $out/share/fonts/truetype/Gafata-Regular.ttf
  '';

  meta = with lib; {
    description = "Gafata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
