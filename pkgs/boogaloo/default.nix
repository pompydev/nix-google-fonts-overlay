{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "boogaloo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/boogaloo/Boogaloo-Regular.ttf?raw=true";
      name = "Boogaloo-Regular.ttf";
      sha256 = "c38febf770bec2b8e30ea6bc1ddb39c9b0ce0e8625d94ceeafbe3af1c7096d9d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Boogaloo-Regular.ttf $out/share/fonts/truetype/Boogaloo-Regular.ttf
  '';

  meta = with lib; {
    description = "Boogaloo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
