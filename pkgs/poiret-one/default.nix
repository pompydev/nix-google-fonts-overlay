{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poiret-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/poiretone/PoiretOne-Regular.ttf?raw=true";
      name = "PoiretOne-Regular.ttf";
      sha256 = "457f2d03263f58e5a6dbcc1b607b10dff6581e7cf9c4ebdf330ec3e6772a3558";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PoiretOne-Regular.ttf $out/share/fonts/truetype/PoiretOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Poiret One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
