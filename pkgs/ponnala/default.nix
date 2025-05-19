{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ponnala-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ponnala/Ponnala-Regular.ttf?raw=true";
      name = "Ponnala-Regular.ttf";
      sha256 = "7febc4f7f386e8fe4485a7579ebadafb8c5d5eeb05660bf35eda33d11f2ed81e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ponnala-Regular.ttf $out/share/fonts/truetype/Ponnala-Regular.ttf
  '';

  meta = with lib; {
    description = "Ponnala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
