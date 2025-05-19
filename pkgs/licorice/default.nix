{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "licorice-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/licorice/Licorice-Regular.ttf?raw=true";
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
