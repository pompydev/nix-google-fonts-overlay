{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arimo-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7252eca1fac7ed118f81c4ba5d520f6f40c22860/apache/arimo/Arimo%5Bwght%5D.ttf?raw=true";
      name = "Arimo_wght_.ttf";
      sha256 = "c75270dfa8b5747c666d9e1915b8c9a6cb6e2de74d103cd0f6ee0104675a3604";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/7252eca1fac7ed118f81c4ba5d520f6f40c22860/apache/arimo/Arimo-Italic%5Bwght%5D.ttf?raw=true";
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
