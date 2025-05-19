{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "frijole-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/frijole/Frijole-Regular.ttf?raw=true";
      name = "Frijole-Regular.ttf";
      sha256 = "e182bbad0e1ba7eb06d93edb1c97a71f5b7d56e27433fb375f5f7138399ab72c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Frijole-Regular.ttf $out/share/fonts/truetype/Frijole-Regular.ttf
  '';

  meta = with lib; {
    description = "Frijole";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
