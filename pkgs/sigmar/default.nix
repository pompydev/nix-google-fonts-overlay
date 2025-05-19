{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sigmar-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/sigmar/Sigmar-Regular.ttf?raw=true";
      name = "Sigmar-Regular.ttf";
      sha256 = "0597d733ed4722af36157f1e72d2415e123a9052655d67410c9ab8a0b223f54d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Sigmar-Regular.ttf $out/share/fonts/truetype/Sigmar-Regular.ttf
  '';

  meta = with lib; {
    description = "Sigmar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
