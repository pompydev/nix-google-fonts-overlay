{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "redacted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/redacted/Redacted-Regular.ttf?raw=true";
      name = "Redacted-Regular.ttf";
      sha256 = "38d8c529c8a995426c8ec75d0b9d465296e541587632da038e4a5d030b4d1069";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Redacted-Regular.ttf $out/share/fonts/truetype/Redacted-Regular.ttf
  '';

  meta = with lib; {
    description = "Redacted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
