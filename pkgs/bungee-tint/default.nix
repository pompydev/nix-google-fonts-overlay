{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "bungee-tint-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/bungeetint/BungeeTint-Regular.ttf?raw=true";
      name = "BungeeTint-Regular.ttf";
      sha256 = "ebe2699c1507981225cfa75c601a2f66aea813e919b34ada735c676fb4b32726";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BungeeTint-Regular.ttf $out/share/fonts/truetype/BungeeTint-Regular.ttf
  '';

  meta = with lib; {
    description = "Bungee Tint";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
