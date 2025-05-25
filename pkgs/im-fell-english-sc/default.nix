{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "im-fell-english-sc-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/imfellenglishsc/IMFeENsc28P.ttf?raw=true";
      name = "IMFeENsc28P.ttf";
      sha256 = "102324fb5434bb5da7963533426b0ad44c85bbc9e7755067535c9d11464a176b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IMFeENsc28P.ttf $out/share/fonts/truetype/IMFeENsc28P.ttf
  '';

  meta = with lib; {
    description = "IM Fell English SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
