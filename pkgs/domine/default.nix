{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "domine-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2194d6669928109624e4238fbcdb51858ec35a99/ofl/domine/Domine[wght].ttf?raw=true";
      name = "Domine_wght_.ttf";
      sha256 = "c63552cb60c658e90c1da3e83f9e7cf203562c39cdbf5a78ba9df62d8e7a1ed7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Domine_wght_.ttf $out/share/fonts/truetype/Domine_wght_.ttf
  '';

  meta = with lib; {
    description = "Domine";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
