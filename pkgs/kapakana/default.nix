{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kapakana-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kapakana/Kapakana%5Bwght%5D.ttf?raw=true";
      name = "Kapakana_wght_.ttf";
      sha256 = "5ff3af9e470b5b278d645099214818ceb3933b542fbfd4b38c0a9b0be29fd35e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Kapakana_wght_.ttf $out/share/fonts/truetype/Kapakana_wght_.ttf
  '';

  meta = with lib; {
    description = "Kapakana";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
