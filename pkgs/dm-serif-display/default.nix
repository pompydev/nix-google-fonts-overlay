{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "dm-serif-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dmserifdisplay/DMSerifDisplay-Regular.ttf?raw=true";
      name = "DMSerifDisplay-Regular.ttf";
      sha256 = "8cc3643535edf039aa5d95440a8542735e9197e4f4b8d9303e980fefbf5ab616";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/dmserifdisplay/DMSerifDisplay-Italic.ttf?raw=true";
      name = "DMSerifDisplay-Italic.ttf";
      sha256 = "df74c0ac387baeaeb0fe4f2324e1668e6a3ed8c09cd9796fe162c71753e19e45";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DMSerifDisplay-Regular.ttf $out/share/fonts/truetype/DMSerifDisplay-Regular.ttf
     install -Dm644 DMSerifDisplay-Italic.ttf $out/share/fonts/truetype/DMSerifDisplay-Italic.ttf
  '';

  meta = with lib; {
    description = "DM Serif Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
