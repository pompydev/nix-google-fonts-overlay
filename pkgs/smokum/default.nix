{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "smokum-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/smokum/Smokum-Regular.ttf?raw=true";
      name = "Smokum-Regular.ttf";
      sha256 = "dfb06e95e7b99724e2e508979bdd679c2a1a9c8413c7f6961656097fd38c9a63";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Smokum-Regular.ttf $out/share/fonts/truetype/Smokum-Regular.ttf
  '';

  meta = with lib; {
    description = "Smokum";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
