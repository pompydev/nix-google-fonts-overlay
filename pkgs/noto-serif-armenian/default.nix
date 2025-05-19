{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-armenian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifarmenian/NotoSerifArmenian%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifArmenian_wdth,wght_.ttf";
      sha256 = "9354b74384d093d59f9a4ad958e188808d58b6f15debeaab18e07bc432f8ce0c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifArmenian_wdth,wght_.ttf $out/share/fonts/truetype/NotoSerifArmenian_wdth,wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Armenian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
