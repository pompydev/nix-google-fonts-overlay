{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udgothic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bizudgothic/BIZUDGothic-Regular.ttf?raw=true";
      name = "BIZUDGothic-Regular.ttf";
      sha256 = "709fcd41e3209fb765da750472f55ccdf925653e9fa7e1eb007cb65c8f749c75";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/bizudgothic/BIZUDGothic-Bold.ttf?raw=true";
      name = "BIZUDGothic-Bold.ttf";
      sha256 = "98a528b6b638463041968783cc0f63adaf4cdc26f5398afed68bab712d1113f3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BIZUDGothic-Regular.ttf $out/share/fonts/truetype/BIZUDGothic-Regular.ttf
     install -Dm644 BIZUDGothic-Bold.ttf $out/share/fonts/truetype/BIZUDGothic-Bold.ttf
  '';

  meta = with lib; {
    description = "BIZ UDGothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
