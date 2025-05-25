{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "macondo-swash-caps-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/macondoswashcaps/MacondoSwashCaps-Regular.ttf?raw=true";
      name = "MacondoSwashCaps-Regular.ttf";
      sha256 = "776c95ad520e4776a45add8d8693e693b566be9f26cd20505256c8e944dc07ea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 MacondoSwashCaps-Regular.ttf $out/share/fonts/truetype/MacondoSwashCaps-Regular.ttf
  '';

  meta = with lib; {
    description = "Macondo Swash Caps";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
