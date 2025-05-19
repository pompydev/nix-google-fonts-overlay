{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gabriela-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gabriela/Gabriela-Regular.ttf?raw=true";
      name = "Gabriela-Regular.ttf";
      sha256 = "c38334bfff10cc97fa6e5c5ddf1f12dd54428bb218d7a423fb3c07bf8180bfd8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gabriela-Regular.ttf $out/share/fonts/truetype/Gabriela-Regular.ttf
  '';

  meta = with lib; {
    description = "Gabriela";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
