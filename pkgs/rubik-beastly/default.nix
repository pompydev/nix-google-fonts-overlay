{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-beastly-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bc8911e6ce854087efe7675afe3caa7876271329/ofl/rubikbeastly/RubikBeastly-Regular.ttf?raw=true";
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
