{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "stalemate-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/stalemate/Stalemate-Regular.ttf?raw=true";
      name = "Stalemate-Regular.ttf";
      sha256 = "36b8c2f2777cfcca17815e63636f749b398062310c089e6c9fe2a65290c7e579";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Stalemate-Regular.ttf $out/share/fonts/truetype/Stalemate-Regular.ttf
  '';

  meta = with lib; {
    description = "Stalemate";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
