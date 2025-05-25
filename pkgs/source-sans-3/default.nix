{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-sans-3-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sourcesans3/SourceSans3%5Bwght%5D.ttf?raw=true";
      name = "SourceSans3_wght_.ttf";
      sha256 = "042fe2cc0b933e328410d7acbd0aa6a1873dca5aef81875f4bc214b08825c7b9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/sourcesans3/SourceSans3-Italic%5Bwght%5D.ttf?raw=true";
      name = "SourceSans3-Italic_wght_.ttf";
      sha256 = "39e3ab05ccd7cb94907c31005bb5bec1d5432f0b096a2b782976e217a540eb6c";
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
