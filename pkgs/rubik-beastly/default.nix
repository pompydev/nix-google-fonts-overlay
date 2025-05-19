{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-beastly-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikbeastly/RubikBeastly-Regular.ttf?raw=true";
      name = "RubikBeastly-Regular.ttf";
      sha256 = "854c5f4bd05aae76d7830e871e2c990ea309a436072d8f0b67a796a80ec1cb18";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikBeastly-Regular.ttf $out/share/fonts/truetype/RubikBeastly-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Beastly";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
