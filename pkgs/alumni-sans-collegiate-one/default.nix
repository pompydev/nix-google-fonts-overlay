{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alumni-sans-collegiate-one-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0df02275bb189dfb709e96205f69b66509ceca07/ofl/alumnisanscollegiateone/AlumniSansCollegiateOne-Regular.ttf?raw=true";
      name = "AlumniSansCollegiateOne-Regular.ttf";
      sha256 = "7d20d30ed9c290df8088b99c24e7796db12513acbf8ae9c339a1829ba6cb5e16";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AlumniSansCollegiateOne-Regular.ttf $out/share/fonts/truetype/AlumniSansCollegiateOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Alumni Sans Collegiate One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
