{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baskervville-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baskervville/Baskervville%5Bwght%5D.ttf?raw=true";
      name = "Baskervville_wght_.ttf";
      sha256 = "a08bcf988383b344aacfd34365a8cd408a4a9665caaf19dc0d716a93833a0fa7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/baskervville/Baskervville-Italic%5Bwght%5D.ttf?raw=true";
      name = "Baskervville-Italic_wght_.ttf";
      sha256 = "279ff53ed5c733efabb206345af87face1c137b8ab2667298d6cf228ebffbf01";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Baskervville_wght_.ttf $out/share/fonts/truetype/Baskervville_wght_.ttf
     install -Dm644 Baskervville-Italic_wght_.ttf $out/share/fonts/truetype/Baskervville-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Baskervville";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
