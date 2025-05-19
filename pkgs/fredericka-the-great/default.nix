{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredericka-the-great-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/frederickathegreat/FrederickatheGreat-Regular.ttf?raw=true";
      name = "FrederickatheGreat-Regular.ttf";
      sha256 = "33dc0832b5e934f3db79dc683dea5029c22eb418183b69669b047355c0c245a2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FrederickatheGreat-Regular.ttf $out/share/fonts/truetype/FrederickatheGreat-Regular.ttf
  '';

  meta = with lib; {
    description = "Fredericka the Great";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
