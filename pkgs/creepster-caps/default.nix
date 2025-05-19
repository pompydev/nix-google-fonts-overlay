{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "creepster-caps-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/creepstercaps/CreepsterCaps-Regular.ttf?raw=true";
      name = "CreepsterCaps-Regular.ttf";
      sha256 = "65280da05a53ce22401277170ff13f220a32a40bd85d6427f67866af378b913d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CreepsterCaps-Regular.ttf $out/share/fonts/truetype/CreepsterCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Creepster Caps";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
