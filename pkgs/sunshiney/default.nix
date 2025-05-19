{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sunshiney-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/sunshiney/Sunshiney-Regular.ttf?raw=true";
      name = "Sunshiney-Regular.ttf";
      sha256 = "2f41cbc6263c033c18f1db7ae6523a89eb50cd5665b0b7635cc3a4c9c9a0fe4d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sunshiney-Regular.ttf $out/share/fonts/truetype/Sunshiney-Regular.ttf
  '';

  meta = with lib; {
    description = "Sunshiney";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
