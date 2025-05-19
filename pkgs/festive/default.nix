{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "festive-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/festive/Festive-Regular.ttf?raw=true";
      name = "Festive-Regular.ttf";
      sha256 = "34940d4e68ffdbaee80e25d9ac8ef956eb0f4965c804d067041373ddca6a9ec8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Festive-Regular.ttf $out/share/fonts/truetype/Festive-Regular.ttf
  '';

  meta = with lib; {
    description = "Festive";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
