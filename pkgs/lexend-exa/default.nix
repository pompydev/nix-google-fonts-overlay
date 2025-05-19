{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-exa-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lexendexa/LexendExa%5Bwght%5D.ttf?raw=true";
      name = "LexendExa_wght_.ttf";
      sha256 = "d03a5ef7cf352a5508c6a64dc7b7b9e50bb7afddba1a90d792a801a6f421a63c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LexendExa_wght_.ttf $out/share/fonts/truetype/LexendExa_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend Exa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
