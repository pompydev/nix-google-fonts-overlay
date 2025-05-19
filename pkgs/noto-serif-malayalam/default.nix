{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-malayalam-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifmalayalam/NotoSerifMalayalam%5Bwght%5D.ttf?raw=true";
      name = "NotoSerifMalayalam_wght_.ttf";
      sha256 = "eed354cadb35992df6e8b32fdb7edb399989b165f0f25e7a921009683db26e8e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifMalayalam_wght_.ttf $out/share/fonts/truetype/NotoSerifMalayalam_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Malayalam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
