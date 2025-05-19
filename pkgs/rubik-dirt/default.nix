{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-dirt-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikdirt/RubikDirt-Regular.ttf?raw=true";
      name = "RubikDirt-Regular.ttf";
      sha256 = "9de3d928e434a47ec85d759012c8a0ebfeab0860076eea4e3989a47c5e213123";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikDirt-Regular.ttf $out/share/fonts/truetype/RubikDirt-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Dirt";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
