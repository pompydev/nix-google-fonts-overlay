{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "great-vibes-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/59adf74d6054b41e8e647193c1cfa69115256843/ofl/greatvibes/GreatVibes-Regular.ttf?raw=true";
      name = "GreatVibes-Regular.ttf";
      sha256 = "826eb3a5ebbbdcff40c31f475c7499ab535a67740d8f1c854192de9eccd24cae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GreatVibes-Regular.ttf $out/share/fonts/truetype/GreatVibes-Regular.ttf
  '';

  meta = with lib; {
    description = "Great Vibes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
