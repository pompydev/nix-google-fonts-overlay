{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "kiwi-maru-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kiwimaru/KiwiMaru-Light.ttf?raw=true";
      name = "KiwiMaru-Light.ttf";
      sha256 = "30f856bc944911b025bfbf640bf6b9ffe18a9c7b06b20d4ef26fe5cc9b3819f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kiwimaru/KiwiMaru-Regular.ttf?raw=true";
      name = "KiwiMaru-Regular.ttf";
      sha256 = "b0c3103b2639f690c1fcb44e060058383174bfd2eb72e6635bc9869b374dee87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/kiwimaru/KiwiMaru-Medium.ttf?raw=true";
      name = "KiwiMaru-Medium.ttf";
      sha256 = "b2659f300a7d48c3f29eb273ffc5e1b26cc416ac8c37ff6bb2f3e43c2f4d235a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KiwiMaru-Light.ttf $out/share/fonts/truetype/KiwiMaru-Light.ttf
     install -Dm644 KiwiMaru-Regular.ttf $out/share/fonts/truetype/KiwiMaru-Regular.ttf
     install -Dm644 KiwiMaru-Medium.ttf $out/share/fonts/truetype/KiwiMaru-Medium.ttf
  '';

  meta = with lib; {
    description = "Kiwi Maru";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
