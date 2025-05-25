{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fredericka-the-great-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/frederickathegreat/FrederickatheGreat-Regular.ttf?raw=true";
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
