{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "belleza-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/belleza/Belleza-Regular.ttf?raw=true";
      name = "Belleza-Regular.ttf";
      sha256 = "a88eb0fdf4e78687a40d3478e1c90d4d3079e8c0d7d3a2452488a3ba805bff1d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Belleza-Regular.ttf $out/share/fonts/truetype/Belleza-Regular.ttf
  '';

  meta = with lib; {
    description = "Belleza";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
