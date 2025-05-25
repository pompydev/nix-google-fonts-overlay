{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "diplomata-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/diplomata/Diplomata-Regular.ttf?raw=true";
      name = "Diplomata-Regular.ttf";
      sha256 = "0197d3dd0c7e8daf4ec373f15a4cdeeb963f76748ffd8360b9150bac90b73997";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Diplomata-Regular.ttf $out/share/fonts/truetype/Diplomata-Regular.ttf
  '';

  meta = with lib; {
    description = "Diplomata";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
