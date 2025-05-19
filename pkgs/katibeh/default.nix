{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "katibeh-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/katibeh/Katibeh-Regular.ttf?raw=true";
      name = "Katibeh-Regular.ttf";
      sha256 = "334eeadb58eb442734fe7dea87412cbbd8c3fd00294252723aadf19a850cf11f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Katibeh-Regular.ttf $out/share/fonts/truetype/Katibeh-Regular.ttf
  '';

  meta = with lib; {
    description = "Katibeh";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
