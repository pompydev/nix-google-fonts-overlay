{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fjalla-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fjallaone/FjallaOne-Regular.ttf?raw=true";
      name = "FjallaOne-Regular.ttf";
      sha256 = "ce3b299625abe3c76f8acd235b57b3e07ac6ee2d550e106a4b4e4d60095ae2ba";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FjallaOne-Regular.ttf $out/share/fonts/truetype/FjallaOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Fjalla One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
