{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "league-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/leaguescript/LeagueScript-Regular.ttf?raw=true";
      name = "LeagueScript-Regular.ttf";
      sha256 = "42c3a493028aec3a2266e540a1264f7b5e26eefd17219dda9b165b928986308a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LeagueScript-Regular.ttf $out/share/fonts/truetype/LeagueScript-Regular.ttf
  '';

  meta = with lib; {
    description = "League Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
