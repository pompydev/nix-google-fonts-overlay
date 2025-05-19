{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mako-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/mako/Mako-Regular.ttf?raw=true";
      name = "Mako-Regular.ttf";
      sha256 = "660904f61bb44671dd8f5029bf179f82c7f78daa1c250c7dadb5927f1f1ef816";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Mako-Regular.ttf $out/share/fonts/truetype/Mako-Regular.ttf
  '';

  meta = with lib; {
    description = "Mako";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
