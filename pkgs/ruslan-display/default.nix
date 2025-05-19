{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ruslan-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ruslandisplay/RuslanDisplay-Regular.ttf?raw=true";
      name = "RuslanDisplay-Regular.ttf";
      sha256 = "6fb5f4db06869e886ca5da3760c547c6d3ebec82aebd3678f314e99ae3347b09";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RuslanDisplay-Regular.ttf $out/share/fonts/truetype/RuslanDisplay-Regular.ttf
  '';

  meta = with lib; {
    description = "Ruslan Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
