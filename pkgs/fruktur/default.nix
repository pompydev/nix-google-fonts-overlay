{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fruktur-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fruktur/Fruktur-Regular.ttf?raw=true";
      name = "Fruktur-Regular.ttf";
      sha256 = "dcba901b5fe11c0b6c3e8d5eb1003339b2dd020e2fc3949014ed0d8ff87715e7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/fruktur/Fruktur-Italic.ttf?raw=true";
      name = "Fruktur-Italic.ttf";
      sha256 = "2fc0cb26f0d1945202b6022ea68ac566826d19e64b461b640e9a1056f1f40218";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fruktur-Regular.ttf $out/share/fonts/truetype/Fruktur-Regular.ttf
     install -Dm644 Fruktur-Italic.ttf $out/share/fonts/truetype/Fruktur-Italic.ttf
  '';

  meta = with lib; {
    description = "Fruktur";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
