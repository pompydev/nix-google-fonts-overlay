{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dotgothic16-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/dotgothic16/DotGothic16-Regular.ttf?raw=true";
      name = "DotGothic16-Regular.ttf";
      sha256 = "3ad9af88726d42b40f7f365f0dcac785af73cf20ea6f1d5b44e57cc21150b8f1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DotGothic16-Regular.ttf $out/share/fonts/truetype/DotGothic16-Regular.ttf
  '';

  meta = with lib; {
    description = "DotGothic16";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
