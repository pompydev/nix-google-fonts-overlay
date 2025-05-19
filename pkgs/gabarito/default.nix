{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gabarito-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/gabarito/Gabarito%5Bwght%5D.ttf?raw=true";
      name = "Gabarito_wght_.ttf";
      sha256 = "8650e2bd7747f7d74619fd7aecbcb0309e6f37b7964024f3fb15ae4833b67ca5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gabarito_wght_.ttf $out/share/fonts/truetype/Gabarito_wght_.ttf
  '';

  meta = with lib; {
    description = "Gabarito";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
