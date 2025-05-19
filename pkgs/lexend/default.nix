{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lexend/Lexend%5Bwght%5D.ttf?raw=true";
      name = "Lexend_wght_.ttf";
      sha256 = "3add53e641fbc81da64da4bb254285e2831b52b029527bc0714e2b9610832ee6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Lexend_wght_.ttf $out/share/fonts/truetype/Lexend_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
