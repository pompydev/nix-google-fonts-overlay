{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "redacted-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/231a8f4a6bf5fb953cf37fa153da6b85e1d05fc3/ofl/redacted/Redacted-Regular.ttf?raw=true";
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
