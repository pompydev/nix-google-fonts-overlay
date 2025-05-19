{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "port-lligat-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/portlligatsans/PortLligatSans-Regular.ttf?raw=true";
      name = "PortLligatSans-Regular.ttf";
      sha256 = "89374c75b8b86c3634abb037997483708611cdd25faa3da9564bb68a9e162757";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PortLligatSans-Regular.ttf $out/share/fonts/truetype/PortLligatSans-Regular.ttf
  '';

  meta = with lib; {
    description = "Port Lligat Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
