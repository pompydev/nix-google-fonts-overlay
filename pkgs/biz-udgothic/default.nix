{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "biz-udgothic-${version}";
  version = "2022-05-11-135659";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01ac47e0b1cddbc298334c69a5dfafb0205ffa28/ofl/bizudgothic/BIZUDGothic-Regular.ttf?raw=true";
      name = "BIZUDGothic-Regular.ttf";
      sha256 = "709fcd41e3209fb765da750472f55ccdf925653e9fa7e1eb007cb65c8f749c75";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/01ac47e0b1cddbc298334c69a5dfafb0205ffa28/ofl/bizudgothic/BIZUDGothic-Bold.ttf?raw=true";
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
