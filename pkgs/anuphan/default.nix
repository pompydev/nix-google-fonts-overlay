{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "anuphan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/anuphan/Anuphan%5Bwght%5D.ttf?raw=true";
      name = "Anuphan_wght_.ttf";
      sha256 = "7ec47ebcaa9d6459d974691cbb42fae52e1449478a607b071bfaf3ccdb433ce4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Anuphan_wght_.ttf $out/share/fonts/truetype/Anuphan_wght_.ttf
  '';

  meta = with lib; {
    description = "Anuphan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
