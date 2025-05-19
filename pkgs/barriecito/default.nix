{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "barriecito-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/barriecito/Barriecito-Regular.ttf?raw=true";
      name = "Barriecito-Regular.ttf";
      sha256 = "ff32a099b68e0eb5e236adcb9a58141d00fbdf196586e421d1c6a0d1859f75b8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Barriecito-Regular.ttf $out/share/fonts/truetype/Barriecito-Regular.ttf
  '';

  meta = with lib; {
    description = "Barriecito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
