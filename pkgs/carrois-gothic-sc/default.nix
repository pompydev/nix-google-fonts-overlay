{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "carrois-gothic-sc-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/carroisgothicsc/CarroisGothicSC-Regular.ttf?raw=true";
      name = "CarroisGothicSC-Regular.ttf";
      sha256 = "3dfc5fe797ab3e04327287d9dbae313847623670417e850d39e24662071f1c98";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CarroisGothicSC-Regular.ttf $out/share/fonts/truetype/CarroisGothicSC-Regular.ttf
  '';

  meta = with lib; {
    description = "Carrois Gothic SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
