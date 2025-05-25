{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-exa-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/lexendexa/LexendExa%5Bwght%5D.ttf?raw=true";
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
