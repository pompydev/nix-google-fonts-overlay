{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amatic-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amaticsc/AmaticSC-Regular.ttf?raw=true";
      name = "AmaticSC-Regular.ttf";
      sha256 = "513a76f96d39a5366bd27c258674aaea35ee51c42b8f3060387f74649ee8c8aa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/amaticsc/AmaticSC-Bold.ttf?raw=true";
      name = "AmaticSC-Bold.ttf";
      sha256 = "d367beadee66efbb657d24d3d8f30f3b60633e9d5c8ded7385541cf775cabb4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AmaticSC-Regular.ttf $out/share/fonts/truetype/AmaticSC-Regular.ttf
     install -Dm644 AmaticSC-Bold.ttf $out/share/fonts/truetype/AmaticSC-Bold.ttf
  '';

  meta = with lib; {
    description = "Amatic SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
