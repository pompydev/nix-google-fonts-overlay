{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "licorice-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/93679897b9eb9d7b2254a738b1042758004b9bab/ofl/licorice/Licorice-Regular.ttf?raw=true";
      name = "Licorice-Regular.ttf";
      sha256 = "c72d8cb2f56e6995b3682d8620e2d602bacf78b67121cdfbface9acc422750d8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Licorice-Regular.ttf $out/share/fonts/truetype/Licorice-Regular.ttf
  '';

  meta = with lib; {
    description = "Licorice";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
