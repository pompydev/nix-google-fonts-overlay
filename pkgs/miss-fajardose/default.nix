{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "miss-fajardose-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/missfajardose/MissFajardose-Regular.ttf?raw=true";
      name = "MissFajardose-Regular.ttf";
      sha256 = "f76e0f245e781a75ea9fa528706b417173f7741439369c07d1501276170ab709";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MissFajardose-Regular.ttf $out/share/fonts/truetype/MissFajardose-Regular.ttf
  '';

  meta = with lib; {
    description = "Miss Fajardose";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
