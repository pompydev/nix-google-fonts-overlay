{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rouge-script-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rougescript/RougeScript-Regular.ttf?raw=true";
      name = "RougeScript-Regular.ttf";
      sha256 = "99de0ca969d9898687305a36f7e6dde6d30806ab7a463ebb4068dd9dd2a54fd6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RougeScript-Regular.ttf $out/share/fonts/truetype/RougeScript-Regular.ttf
  '';

  meta = with lib; {
    description = "Rouge Script";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
