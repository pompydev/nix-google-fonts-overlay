{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "alexandria-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/alexandria/Alexandria%5Bwght%5D.ttf?raw=true";
      name = "Alexandria_wght_.ttf";
      sha256 = "db8ae03b62d55a65aa4e04307878df8c00d6e5388e4800635cbe0e22b6411b64";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Alexandria_wght_.ttf $out/share/fonts/truetype/Alexandria_wght_.ttf
  '';

  meta = with lib; {
    description = "Alexandria";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
