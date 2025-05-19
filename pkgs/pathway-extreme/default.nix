{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "pathway-extreme-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pathwayextreme/PathwayExtreme%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "PathwayExtreme_opsz,wdth,wght_.ttf";
      sha256 = "a7640e7731dbd5556123aa8b56948c23542ce8696f0bc882ce56f2dd9a9ee9fa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pathwayextreme/PathwayExtreme-Italic%5Bopsz,wdth,wght%5D.ttf?raw=true";
      name = "PathwayExtreme-Italic_opsz,wdth,wght_.ttf";
      sha256 = "ad71db067a33c101fb1ec792e94c405f22274f68a6842dc4521f623c17805fa1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PathwayExtreme_opsz,wdth,wght_.ttf $out/share/fonts/truetype/PathwayExtreme_opsz,wdth,wght_.ttf
     install -Dm644 PathwayExtreme-Italic_opsz,wdth,wght_.ttf $out/share/fonts/truetype/PathwayExtreme-Italic_opsz,wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Pathway Extreme";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
