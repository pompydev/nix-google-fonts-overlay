{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dr-sugiyama-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/drsugiyama/DrSugiyama-Regular.ttf?raw=true";
      name = "DrSugiyama-Regular.ttf";
      sha256 = "8436c1eae3a06126a6e0aa85b1dffb1b507d39eab7b6512a9bb1adc5d514d9b9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DrSugiyama-Regular.ttf $out/share/fonts/truetype/DrSugiyama-Regular.ttf
  '';

  meta = with lib; {
    description = "Dr Sugiyama";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
