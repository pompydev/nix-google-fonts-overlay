{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jsmath-cmmi10-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/jsmathcmmi10/jsMath-cmmi10.ttf?raw=true";
      name = "jsMath-cmmi10.ttf";
      sha256 = "f8f569e095af15da561908026353a73fe7d176f276d86bf7f6fee094bae5bc87";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 jsMath-cmmi10.ttf $out/share/fonts/truetype/jsMath-cmmi10.ttf
  '';

  meta = with lib; {
    description = "jsMath cmmi10";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
