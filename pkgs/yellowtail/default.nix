{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "yellowtail-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/yellowtail/Yellowtail-Regular.ttf?raw=true";
      name = "Yellowtail-Regular.ttf";
      sha256 = "3e06841b13000975f3cc38aa84e326e601a4378a4c52d50b5e9fee3598c5d236";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Yellowtail-Regular.ttf $out/share/fonts/truetype/Yellowtail-Regular.ttf
  '';

  meta = with lib; {
    description = "Yellowtail";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
