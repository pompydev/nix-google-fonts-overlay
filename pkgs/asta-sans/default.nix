{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "asta-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/astasans/AstaSans%5Bwght%5D.ttf?raw=true";
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
