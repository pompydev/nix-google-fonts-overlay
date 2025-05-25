{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "vibes-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/vibes/Vibes-Regular.ttf?raw=true";
      name = "Vibes-Regular.ttf";
      sha256 = "297d9c8499e7383ac7675932741625ab12d9bb3abd1c31d2659b385d965a7ab7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Vibes-Regular.ttf $out/share/fonts/truetype/Vibes-Regular.ttf
  '';

  meta = with lib; {
    description = "Vibes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
