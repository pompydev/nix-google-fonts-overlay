{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gloria-hallelujah-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gloriahallelujah/GloriaHallelujah.ttf?raw=true";
      name = "GloriaHallelujah.ttf";
      sha256 = "eb59f2762ce8785a292bebb2af3b3e6aa21454913d791f5f25441d1d57ead9fc";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GloriaHallelujah.ttf $out/share/fonts/truetype/GloriaHallelujah.ttf
  '';

  meta = with lib; {
    description = "Gloria Hallelujah";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
