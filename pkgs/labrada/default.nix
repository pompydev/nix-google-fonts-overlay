{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "labrada-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/labrada/Labrada%5Bwght%5D.ttf?raw=true";
      name = "Labrada_wght_.ttf";
      sha256 = "0374729c732da52ad8681bc0a84a7e992cef34dbfc5f681dfdbdf7c5de25617b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/labrada/Labrada-Italic%5Bwght%5D.ttf?raw=true";
      name = "Labrada-Italic_wght_.ttf";
      sha256 = "d5d491f4d6c530707e2cc689a4be4a9b28c45e98012ecf6e040b0ac38ee9b428";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Labrada_wght_.ttf $out/share/fonts/truetype/Labrada_wght_.ttf
     install -Dm644 Labrada-Italic_wght_.ttf $out/share/fonts/truetype/Labrada-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Labrada";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
