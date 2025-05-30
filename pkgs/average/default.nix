{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "average-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/average/Average-Regular.ttf?raw=true";
      name = "Average-Regular.ttf";
      sha256 = "f9efcc21a222870178c86d2d47d3861a40284d25acd28657554f646f68902e34";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Average-Regular.ttf $out/share/fonts/truetype/Average-Regular.ttf
  '';

  meta = with lib; {
    description = "Average";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
