{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "climate-crisis-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/climatecrisis/ClimateCrisis%5BYEAR%5D.ttf?raw=true";
      name = "ClimateCrisis_YEAR_.ttf";
      sha256 = "a4a802eece92b131296a38177b54c74f2581ad725f2c73fe51b86a31c8ce52b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ClimateCrisis_YEAR_.ttf $out/share/fonts/truetype/ClimateCrisis_YEAR_.ttf
  '';

  meta = with lib; {
    description = "Climate Crisis";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
