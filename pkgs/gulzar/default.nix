{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gulzar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gulzar/Gulzar-Regular.ttf?raw=true";
      name = "Gulzar-Regular.ttf";
      sha256 = "246337973ac64e8b70fe611405dcf32a395a8885c4497dc45dbc4975d3ac0831";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gulzar-Regular.ttf $out/share/fonts/truetype/Gulzar-Regular.ttf
  '';

  meta = with lib; {
    description = "Gulzar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
