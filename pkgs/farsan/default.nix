{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "farsan-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/farsan/Farsan-Regular.ttf?raw=true";
      name = "Farsan-Regular.ttf";
      sha256 = "7bb968454a2dde084c9fb0f99a9921e9a8f96b0cd28dedf8f545ec23d52c3550";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Farsan-Regular.ttf $out/share/fonts/truetype/Farsan-Regular.ttf
  '';

  meta = with lib; {
    description = "Farsan";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
