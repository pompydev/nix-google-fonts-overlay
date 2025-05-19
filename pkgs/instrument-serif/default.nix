{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "instrument-serif-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/instrumentserif/InstrumentSerif-Regular.ttf?raw=true";
      name = "InstrumentSerif-Regular.ttf";
      sha256 = "498efd461f6ddfcb7a111bf9a565709d2085d48201d501ead960d93e84ffbb88";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/instrumentserif/InstrumentSerif-Italic.ttf?raw=true";
      name = "InstrumentSerif-Italic.ttf";
      sha256 = "08939b8bdf534afec24ae0ef5e03f948940cd9a8fe08e7fecbad040e62327385";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 InstrumentSerif-Regular.ttf $out/share/fonts/truetype/InstrumentSerif-Regular.ttf
     install -Dm644 InstrumentSerif-Italic.ttf $out/share/fonts/truetype/InstrumentSerif-Italic.ttf
  '';

  meta = with lib; {
    description = "Instrument Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
