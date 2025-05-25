{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "mako-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/mako/Mako-Regular.ttf?raw=true";
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
