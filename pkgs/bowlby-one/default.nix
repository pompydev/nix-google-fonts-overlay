{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bowlby-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bowlbyone/BowlbyOne-Regular.ttf?raw=true";
      name = "BowlbyOne-Regular.ttf";
      sha256 = "c46a806d7b51fd4987e5f0be449fe40a944cb407e43290ce1cdeed029a8cdc1d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BowlbyOne-Regular.ttf $out/share/fonts/truetype/BowlbyOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Bowlby One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
