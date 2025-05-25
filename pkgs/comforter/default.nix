{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "comforter-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/comforter/Comforter-Regular.ttf?raw=true";
      name = "Comforter-Regular.ttf";
      sha256 = "2852da85b2fbfd37ccd87387f3578a251cb9a8814fbab22c4487f792936a2267";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Comforter-Regular.ttf $out/share/fonts/truetype/Comforter-Regular.ttf
  '';

  meta = with lib; {
    description = "Comforter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
