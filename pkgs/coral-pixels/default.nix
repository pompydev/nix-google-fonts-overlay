{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coral-pixels-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/coralpixels/CoralPixels-Regular.ttf?raw=true";
      name = "CoralPixels-Regular.ttf";
      sha256 = "c42dc4b002d50e1948beb761103631bf90a61878fa3e560699734091ad561540";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CoralPixels-Regular.ttf $out/share/fonts/truetype/CoralPixels-Regular.ttf
  '';

  meta = with lib; {
    description = "Coral Pixels";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
