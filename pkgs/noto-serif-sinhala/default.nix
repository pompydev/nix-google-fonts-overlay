{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-sinhala-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifsinhala/NotoSerifSinhala%5Bwdth,wght%5D.ttf?raw=true";
      name = "NotoSerifSinhala_wdth,wght_.ttf";
      sha256 = "2b0df6b8bde56d3b934ba89fada82486b1ec50ee06842c81be36496f8c9b5ac9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifSinhala_wdth-wght_.ttf $out/share/fonts/truetype/NotoSerifSinhala_wdth-wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Sinhala";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
