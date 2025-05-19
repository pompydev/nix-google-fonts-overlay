{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "piedra-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/piedra/Piedra-Regular.ttf?raw=true";
      name = "Piedra-Regular.ttf";
      sha256 = "2e9d00f94d3d78f38618250d03d3e8bccca541c956d5e0a437c62d708ef6c1da";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Piedra-Regular.ttf $out/share/fonts/truetype/Piedra-Regular.ttf
  '';

  meta = with lib; {
    description = "Piedra";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
