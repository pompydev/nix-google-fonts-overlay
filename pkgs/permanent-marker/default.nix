{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "permanent-marker-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/permanentmarker/PermanentMarker-Regular.ttf?raw=true";
      name = "PermanentMarker-Regular.ttf";
      sha256 = "28f82c8a7943cb8e9d599f8554da1d4fc75dbcf69b9885ad6c0611d20c6946c5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PermanentMarker-Regular.ttf $out/share/fonts/truetype/PermanentMarker-Regular.ttf
  '';

  meta = with lib; {
    description = "Permanent Marker";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
