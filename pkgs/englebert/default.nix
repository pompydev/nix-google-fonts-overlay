{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "englebert-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/englebert/Englebert-Regular.ttf?raw=true";
      name = "Englebert-Regular.ttf";
      sha256 = "97be7df4f050113b713077b9cb4a51e7f62c155ba22c7adf7ee65e0d7b0f7577";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Englebert-Regular.ttf $out/share/fonts/truetype/Englebert-Regular.ttf
  '';

  meta = with lib; {
    description = "Englebert";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
