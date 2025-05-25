{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-doodle-shadow-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikdoodleshadow/RubikDoodleShadow-Regular.ttf?raw=true";
      name = "RubikDoodleShadow-Regular.ttf";
      sha256 = "cb8b89235d7a7e1eb3658ef42daaadc7c0c2e5ed41a92cf76211ee6987531358";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikDoodleShadow-Regular.ttf $out/share/fonts/truetype/RubikDoodleShadow-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Doodle Shadow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
