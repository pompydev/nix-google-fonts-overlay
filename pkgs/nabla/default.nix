{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nabla-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/nabla/Nabla%5BEDPT,EHLT%5D.ttf?raw=true";
      name = "Nabla_EDPT,EHLT_.ttf";
      sha256 = "e45cec60eb2099b4b4ffee8ebe005d1d3060771071ede1caeeeb12e37a2c00ae";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Nabla_EDPT-EHLT_.ttf $out/share/fonts/truetype/Nabla_EDPT-EHLT_.ttf
  '';

  meta = with lib; {
    description = "Nabla";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
