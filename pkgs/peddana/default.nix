{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "peddana-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/peddana/Peddana-Regular.ttf?raw=true";
      name = "Peddana-Regular.ttf";
      sha256 = "1aca2e50d3a8dd43250bf942049ae18b8fda542f0469434eb35c8a53b1157836";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Peddana-Regular.ttf $out/share/fonts/truetype/Peddana-Regular.ttf
  '';

  meta = with lib; {
    description = "Peddana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
