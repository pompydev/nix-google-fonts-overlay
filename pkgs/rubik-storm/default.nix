{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-storm-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikstorm/RubikStorm-Regular.ttf?raw=true";
      name = "RubikStorm-Regular.ttf";
      sha256 = "0ccc7b5901c6ad6908dfc0125f12ef0dc2647c8b8641c6dd70328df86108229c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikStorm-Regular.ttf $out/share/fonts/truetype/RubikStorm-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Storm";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
