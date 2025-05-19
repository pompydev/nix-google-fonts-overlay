{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "shalimar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/shalimar/Shalimar-Regular.ttf?raw=true";
      name = "Shalimar-Regular.ttf";
      sha256 = "00b0a11c7ba12d8f1437db6a95977ecd5453749f119b93cf2502d0a41e05961c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Shalimar-Regular.ttf $out/share/fonts/truetype/Shalimar-Regular.ttf
  '';

  meta = with lib; {
    description = "Shalimar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
