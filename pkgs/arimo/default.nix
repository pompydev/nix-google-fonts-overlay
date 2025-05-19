{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arimo-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/arimo/Arimo%5Bwght%5D.ttf?raw=true";
      name = "Arimo_wght_.ttf";
      sha256 = "c75270dfa8b5747c666d9e1915b8c9a6cb6e2de74d103cd0f6ee0104675a3604";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/arimo/Arimo-Italic%5Bwght%5D.ttf?raw=true";
      name = "Arimo-Italic_wght_.ttf";
      sha256 = "bd248f69d254987da54bdfe18d229c668a6734f5f098c5dbfd5873553935b89b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arimo_wght_.ttf $out/share/fonts/truetype/Arimo_wght_.ttf
     install -Dm644 Arimo-Italic_wght_.ttf $out/share/fonts/truetype/Arimo-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Arimo";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
