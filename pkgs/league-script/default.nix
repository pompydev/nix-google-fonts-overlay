{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "league-script-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/17eecaf5f05c6096272cd820c0061a79a07667c1/ofl/leaguescript/LeagueScript-Regular.ttf?raw=true";
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
