{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "goblin-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/goblinone/GoblinOne.ttf?raw=true";
      name = "GoblinOne.ttf";
      sha256 = "26a15eafd8911f547e846066a1eea0521af2d870d6f17b8ecf0741768b99d099";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GoblinOne.ttf $out/share/fonts/truetype/GoblinOne.ttf
  '';

  meta = with lib; {
    description = "Goblin One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
