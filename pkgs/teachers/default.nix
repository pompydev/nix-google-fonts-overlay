{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "teachers-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/teachers/Teachers%5Bwght%5D.ttf?raw=true";
      name = "Teachers_wght_.ttf";
      sha256 = "b59c8c0c5b1990935916d3fc414f87d0116f1bc0be355382968454e5d4b8e015";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/teachers/Teachers-Italic%5Bwght%5D.ttf?raw=true";
      name = "Teachers-Italic_wght_.ttf";
      sha256 = "5e0edd5dfffac145df5fa1c10c85baf350e3f738d6c2b2dbbf487f7427ce9ea9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Teachers_wght_.ttf $out/share/fonts/truetype/Teachers_wght_.ttf
     install -Dm644 Teachers-Italic_wght_.ttf $out/share/fonts/truetype/Teachers-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Teachers";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
