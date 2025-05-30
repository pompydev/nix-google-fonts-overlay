{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "press-start-2p-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pressstart2p/PressStart2P-Regular.ttf?raw=true";
      name = "PressStart2P-Regular.ttf";
      sha256 = "034c77f1f05ec89421e4a63f0e3a4ca1ecf852cc6d2bf611f126f275728e017d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PressStart2P-Regular.ttf $out/share/fonts/truetype/PressStart2P-Regular.ttf
  '';

  meta = with lib; {
    description = "Press Start 2P";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
