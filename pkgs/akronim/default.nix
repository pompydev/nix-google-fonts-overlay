{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "akronim-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/akronim/Akronim-Regular.ttf?raw=true";
      name = "Akronim-Regular.ttf";
      sha256 = "b5528ba2b9d60b90cbbe06e587655762dc518616d2613cbdf616751beaf7e2f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Akronim-Regular.ttf $out/share/fonts/truetype/Akronim-Regular.ttf
  '';

  meta = with lib; {
    description = "Akronim";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
