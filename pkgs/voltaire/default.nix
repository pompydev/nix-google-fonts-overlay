{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "voltaire-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/voltaire/Voltaire-Regular.ttf?raw=true";
      name = "Voltaire-Regular.ttf";
      sha256 = "f46e955318c841722e8b7c9dfff1c9bccfe4c94ab69c00d7ea68c6f81d2e615e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Voltaire-Regular.ttf $out/share/fonts/truetype/Voltaire-Regular.ttf
  '';

  meta = with lib; {
    description = "Voltaire";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
