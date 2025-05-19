{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "signika-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/signika/Signika%5BGRAD,wght%5D.ttf?raw=true";
      name = "Signika_GRAD,wght_.ttf";
      sha256 = "fae0180ef82a6169d169854595377e1dfa3ab657c96995be8cbf128ffaf07820";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Signika_GRAD,wght_.ttf $out/share/fonts/truetype/Signika_GRAD,wght_.ttf
  '';

  meta = with lib; {
    description = "Signika";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
