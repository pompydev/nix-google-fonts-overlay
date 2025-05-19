{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-kawi-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosanskawi/NotoSansKawi%5Bwght%5D.ttf?raw=true";
      name = "NotoSansKawi_wght_.ttf";
      sha256 = "8261be9862d01826ad75af8596129eff72ab4ce098d72b42a4549e4a6292c518";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansKawi_wght_.ttf $out/share/fonts/truetype/NotoSansKawi_wght_.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Kawi";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
