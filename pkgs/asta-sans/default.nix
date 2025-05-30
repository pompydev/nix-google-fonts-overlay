{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asta-sans-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/astasans/AstaSans%5Bwght%5D.ttf?raw=true";
      name = "AstaSans_wght_.ttf";
      sha256 = "f68410bf7d04deb992097758640145c72ddcf234070794237fc4994e18991c33";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AstaSans_wght_.ttf $out/share/fonts/truetype/AstaSans_wght_.ttf
  '';

  meta = with lib; {
    description = "Asta Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
