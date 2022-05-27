{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-sans-3-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4013637d2e1a67ceb8b0a50957bbbff41a27d0f6/ofl/sourcesans3/SourceSans3%5Bwght%5D.ttf?raw=true";
      name = "SourceSans3_wght_.ttf";
      sha256 = "8b95ef0061a8eb29ec83589c30e9c4cea279590782ac58963ab5edfca9a51493";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4013637d2e1a67ceb8b0a50957bbbff41a27d0f6/ofl/sourcesans3/SourceSans3-Italic%5Bwght%5D.ttf?raw=true";
      name = "SourceSans3-Italic_wght_.ttf";
      sha256 = "31463a98f9bcd77c8a1451906823054d821e70b25cc6c4ec8d3eff670ffc3855";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceSans3_wght_.ttf $out/share/fonts/truetype/SourceSans3_wght_.ttf
     install -Dm644 SourceSans3-Italic_wght_.ttf $out/share/fonts/truetype/SourceSans3-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Source Sans 3";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
