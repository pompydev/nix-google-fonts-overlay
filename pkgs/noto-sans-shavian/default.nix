{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-shavian-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansshavian/NotoSansShavian-Regular.ttf?raw=true";
      name = "NotoSansShavian-Regular.ttf";
      sha256 = "9f57b0429b23616aee4a662da73caca681fbcb6895fd212539b70bf596c209d5";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansShavian-Regular.ttf $out/share/fonts/truetype/NotoSansShavian-Regular.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Shavian";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
