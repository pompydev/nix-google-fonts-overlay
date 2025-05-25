{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "langar-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/langar/Langar-Regular.ttf?raw=true";
      name = "Langar-Regular.ttf";
      sha256 = "b3c5559480f2c8587bdc24816f92ed3ad906d1d2ccc2294d2e051dc4ea0fe806";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Langar-Regular.ttf $out/share/fonts/truetype/Langar-Regular.ttf
  '';

  meta = with lib; {
    description = "Langar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
