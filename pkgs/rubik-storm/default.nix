{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-storm-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikstorm/RubikStorm-Regular.ttf?raw=true";
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
