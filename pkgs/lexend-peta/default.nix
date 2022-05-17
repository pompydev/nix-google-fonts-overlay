{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "lexend-peta-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beda156f5a2abc96ec52442f60bb1ab4d122e38d/ofl/lexendpeta/LexendPeta[wght].ttf?raw=true";
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
