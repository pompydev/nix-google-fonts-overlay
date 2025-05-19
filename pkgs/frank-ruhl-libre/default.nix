{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "frank-ruhl-libre-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/frankruhllibre/FrankRuhlLibre%5Bwght%5D.ttf?raw=true";
      name = "FrankRuhlLibre_wght_.ttf";
      sha256 = "f9bf26966681037aae894b031bd0dcf2c1bfdfa128dd0640cf276fe62a338a43";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FrankRuhlLibre_wght_.ttf $out/share/fonts/truetype/FrankRuhlLibre_wght_.ttf
  '';

  meta = with lib; {
    description = "Frank Ruhl Libre";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
