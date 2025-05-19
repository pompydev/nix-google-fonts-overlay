{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "freckle-face-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/freckleface/FreckleFace-Regular.ttf?raw=true";
      name = "FreckleFace-Regular.ttf";
      sha256 = "54b61a9f5bac3eb3a3d7f78f99d4d9c5d5688a9859e79bbf8704ae79c7f8f0fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FreckleFace-Regular.ttf $out/share/fonts/truetype/FreckleFace-Regular.ttf
  '';

  meta = with lib; {
    description = "Freckle Face";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
