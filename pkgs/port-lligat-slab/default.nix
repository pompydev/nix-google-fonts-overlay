{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "port-lligat-slab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/portlligatslab/PortLligatSlab-Regular.ttf?raw=true";
      name = "PortLligatSlab-Regular.ttf";
      sha256 = "70edb02d7c38cde09b379f9101322fb93189a35276e79eb15c240780bd3b4af7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PortLligatSlab-Regular.ttf $out/share/fonts/truetype/PortLligatSlab-Regular.ttf
  '';

  meta = with lib; {
    description = "Port Lligat Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
