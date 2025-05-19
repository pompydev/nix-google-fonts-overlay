{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "instrument-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/instrumentsans/InstrumentSans%5Bwdth,wght%5D.ttf?raw=true";
      name = "InstrumentSans_wdth,wght_.ttf";
      sha256 = "b24f1812584816958afcf22e22d08e44318c5e51651e25d2438efdde389b33b1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/instrumentsans/InstrumentSans-Italic%5Bwdth,wght%5D.ttf?raw=true";
      name = "InstrumentSans-Italic_wdth,wght_.ttf";
      sha256 = "a74203cc5066a3b2f8de1a7b0887ef897773c2319dc86c911f8e85350cde0d07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InstrumentSans_wdth,wght_.ttf $out/share/fonts/truetype/InstrumentSans_wdth,wght_.ttf
     install -Dm644 InstrumentSans-Italic_wdth,wght_.ttf $out/share/fonts/truetype/InstrumentSans-Italic_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Instrument Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
