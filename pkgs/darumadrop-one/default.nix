{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "darumadrop-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/darumadropone/DarumadropOne-Regular.ttf?raw=true";
      name = "DarumadropOne-Regular.ttf";
      sha256 = "beef6d9031918823176ea0f9f729cb811a5f250598d7c8c684b3dee333810689";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DarumadropOne-Regular.ttf $out/share/fonts/truetype/DarumadropOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Darumadrop One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
