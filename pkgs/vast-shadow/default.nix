{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vast-shadow-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/vastshadow/VastShadow-Regular.ttf?raw=true";
      name = "VastShadow-Regular.ttf";
      sha256 = "98bdf7f93c2330697078ece27e48dea7d97b253a547d699bf7afc4bdfa641a93";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 VastShadow-Regular.ttf $out/share/fonts/truetype/VastShadow-Regular.ttf
  '';

  meta = with lib; {
    description = "Vast Shadow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
