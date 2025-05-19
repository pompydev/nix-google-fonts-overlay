{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jaro-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jaro/Jaro%5Bopsz%5D.ttf?raw=true";
      name = "Jaro_opsz_.ttf";
      sha256 = "38d50e38a6fb082069984b363eb0a9280fc6a5e7f8a69fce2afce52bb6bc9670";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jaro_opsz_.ttf $out/share/fonts/truetype/Jaro_opsz_.ttf
  '';

  meta = with lib; {
    description = "Jaro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
