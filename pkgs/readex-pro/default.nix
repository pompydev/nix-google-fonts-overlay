{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "readex-pro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/readexpro/ReadexPro%5BHEXP,wght%5D.ttf?raw=true";
      name = "ReadexPro_HEXP,wght_.ttf";
      sha256 = "268bba7e1e8f3b14d798b3fb0e40ebaa3fc39308c9ac0020e2faf6df181cc30e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ReadexPro_HEXP,wght_.ttf $out/share/fonts/truetype/ReadexPro_HEXP,wght_.ttf
  '';

  meta = with lib; {
    description = "Readex Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
