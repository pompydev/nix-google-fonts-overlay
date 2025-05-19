{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "astloch-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/astloch/Astloch-Regular.ttf?raw=true";
      name = "Astloch-Regular.ttf";
      sha256 = "1b6f98e4c391da70d9166182369f90164cb02870ad210c4b3287f35ff28227f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/astloch/Astloch-Bold.ttf?raw=true";
      name = "Astloch-Bold.ttf";
      sha256 = "dee95fb52f9b24afc701e9991208275f654160870db06bec84cecb25e10fbeee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Astloch-Regular.ttf $out/share/fonts/truetype/Astloch-Regular.ttf
     install -Dm644 Astloch-Bold.ttf $out/share/fonts/truetype/Astloch-Bold.ttf
  '';

  meta = with lib; {
    description = "Astloch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
