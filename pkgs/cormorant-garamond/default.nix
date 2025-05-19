{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cormorant-garamond-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantgaramond/CormorantGaramond%5Bwght%5D.ttf?raw=true";
      name = "CormorantGaramond_wght_.ttf";
      sha256 = "b20b7d9626dd956b2c5e558692ad328b1f19e3275e2782db4fa07670d83f35e0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cormorantgaramond/CormorantGaramond-Italic%5Bwght%5D.ttf?raw=true";
      name = "CormorantGaramond-Italic_wght_.ttf";
      sha256 = "0f48ea6abb2084537854f7174c470991a463b13036309e3b50a81511611c530d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CormorantGaramond_wght_.ttf $out/share/fonts/truetype/CormorantGaramond_wght_.ttf
     install -Dm644 CormorantGaramond-Italic_wght_.ttf $out/share/fonts/truetype/CormorantGaramond-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Cormorant Garamond";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
