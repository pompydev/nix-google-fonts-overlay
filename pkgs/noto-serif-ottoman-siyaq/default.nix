{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-ottoman-siyaq-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notoserifottomansiyaq/NotoSerifOttomanSiyaq-Regular.ttf?raw=true";
      name = "NotoSerifOttomanSiyaq-Regular.ttf";
      sha256 = "c709105016fb6db957cfcf8ce504c115fe504b6a9055427ff227b73a24d7dd6c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifOttomanSiyaq-Regular.ttf $out/share/fonts/truetype/NotoSerifOttomanSiyaq-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Serif Ottoman Siyaq";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
