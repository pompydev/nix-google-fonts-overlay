{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "goblin-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/goblinone/GoblinOne.ttf?raw=true";
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
