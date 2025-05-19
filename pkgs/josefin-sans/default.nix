{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "josefin-sans-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/josefinsans/JosefinSans%5Bwght%5D.ttf?raw=true";
      name = "JosefinSans_wght_.ttf";
      sha256 = "9255abdb5f393bc51e101abbd07a716a977fd3e15472b1b84b260f426a342bfd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/josefinsans/JosefinSans-Italic%5Bwght%5D.ttf?raw=true";
      name = "JosefinSans-Italic_wght_.ttf";
      sha256 = "c22b42ca690be7ea07d04415ac70b48603dff88e854738cba4bd87027b905ef1";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 JosefinSans_wght_.ttf $out/share/fonts/truetype/JosefinSans_wght_.ttf
     install -Dm644 JosefinSans-Italic_wght_.ttf $out/share/fonts/truetype/JosefinSans-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Josefin Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
