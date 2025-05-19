{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hanalei-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/hanalei/Hanalei-Regular.ttf?raw=true";
      name = "Hanalei-Regular.ttf";
      sha256 = "000ddd2a6be57f52aa41876c2ba71310e2a711f0343c1bdd71e43c9f137000f6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Hanalei-Regular.ttf $out/share/fonts/truetype/Hanalei-Regular.ttf
  '';

  meta = with lib; {
    description = "Hanalei";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
