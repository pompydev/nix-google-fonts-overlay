{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "castoro-titling-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/castorotitling/CastoroTitling-Regular.ttf?raw=true";
      name = "CastoroTitling-Regular.ttf";
      sha256 = "64360ca1f8d8da1a983cbda6bac74c1bd47aeda41e116d9377e0ec629b029f44";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CastoroTitling-Regular.ttf $out/share/fonts/truetype/CastoroTitling-Regular.ttf
  '';

  meta = with lib; {
    description = "Castoro Titling";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
