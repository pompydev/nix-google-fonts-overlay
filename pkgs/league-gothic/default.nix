{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "league-gothic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/leaguegothic/LeagueGothic%5Bwdth%5D.ttf?raw=true";
      name = "LeagueGothic_wdth_.ttf";
      sha256 = "3b0e998c9a0034222394ffecdd383e6948259ad037b95555b139a217629ce1d0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LeagueGothic_wdth_.ttf $out/share/fonts/truetype/LeagueGothic_wdth_.ttf
  '';

  meta = with lib; {
    description = "League Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
