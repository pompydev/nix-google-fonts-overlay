{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "port-lligat-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/portlligatsans/PortLligatSans-Regular.ttf?raw=true";
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
