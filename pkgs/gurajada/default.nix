{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gurajada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gurajada/Gurajada-Regular.ttf?raw=true";
      name = "Gurajada-Regular.ttf";
      sha256 = "353c1289a6f4ba743154c870418272cf68e0f63c0c38598ed33cba814d3178e8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gurajada-Regular.ttf $out/share/fonts/truetype/Gurajada-Regular.ttf
  '';

  meta = with lib; {
    description = "Gurajada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
