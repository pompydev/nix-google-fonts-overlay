{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "geostar-fill-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/geostarfill/GeostarFill-Regular.ttf?raw=true";
      name = "GeostarFill-Regular.ttf";
      sha256 = "f09acdc20fa02f320e97046f618cb5e424d12d97a19d4746f05ea15371de12a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GeostarFill-Regular.ttf $out/share/fonts/truetype/GeostarFill-Regular.ttf
  '';

  meta = with lib; {
    description = "Geostar Fill";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
