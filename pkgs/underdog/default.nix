{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "underdog-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/underdog/Underdog-Regular.ttf?raw=true";
      name = "Underdog-Regular.ttf";
      sha256 = "33f9aee5b2aaeb85e1f433fb21916d0c6dbae74e23b94d978b8131bdbddc40c6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Underdog-Regular.ttf $out/share/fonts/truetype/Underdog-Regular.ttf
  '';

  meta = with lib; {
    description = "Underdog";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
