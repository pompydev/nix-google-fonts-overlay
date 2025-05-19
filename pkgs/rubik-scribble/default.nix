{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-scribble-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikscribble/RubikScribble-Regular.ttf?raw=true";
      name = "RubikScribble-Regular.ttf";
      sha256 = "341d083481febe704791212f560a0898039d6a5744c8819102f3ce7a7f8fc2d4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikScribble-Regular.ttf $out/share/fonts/truetype/RubikScribble-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Scribble";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
