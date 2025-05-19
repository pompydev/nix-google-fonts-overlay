{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-peta-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/lexendpeta/LexendPeta%5Bwght%5D.ttf?raw=true";
      name = "LexendPeta_wght_.ttf";
      sha256 = "48bd753c216bdb19a469a6570a8756f23045c1e46f8d498f6cf1038cbcdc135b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 LexendPeta_wght_.ttf $out/share/fonts/truetype/LexendPeta_wght_.ttf
  '';

  meta = with lib; {
    description = "Lexend Peta";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
