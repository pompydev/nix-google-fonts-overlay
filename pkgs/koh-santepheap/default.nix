{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "koh-santepheap-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/kohsantepheap/KohSantepheap-Thin.ttf?raw=true";
      name = "KohSantepheap-Thin.ttf";
      sha256 = "efc6360978f1f0acedb84116ca7d90447cb8fbed056b36b89b109bce698a144e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/kohsantepheap/KohSantepheap-Light.ttf?raw=true";
      name = "KohSantepheap-Light.ttf";
      sha256 = "340c7209ab55fe60b94506cf59894cdeaacca194e81e5deb8807d12b89be5383";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/kohsantepheap/KohSantepheap-Regular.ttf?raw=true";
      name = "KohSantepheap-Regular.ttf";
      sha256 = "d126f680d8081db439097252bdbe8846019f1a66737295d53775c4f56e2254c2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/kohsantepheap/KohSantepheap-Bold.ttf?raw=true";
      name = "KohSantepheap-Bold.ttf";
      sha256 = "7b1503b36d65a7c51d74d089d73153401013c960135f0697bea560f38e4e1cb9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/kohsantepheap/KohSantepheap-Black.ttf?raw=true";
      name = "KohSantepheap-Black.ttf";
      sha256 = "8f55fefd109aa87cab84befbd19279566df6b7b500009a8760275d385eef5898";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 KohSantepheap-Thin.ttf $out/share/fonts/truetype/KohSantepheap-Thin.ttf
     install -Dm644 KohSantepheap-Light.ttf $out/share/fonts/truetype/KohSantepheap-Light.ttf
     install -Dm644 KohSantepheap-Regular.ttf $out/share/fonts/truetype/KohSantepheap-Regular.ttf
     install -Dm644 KohSantepheap-Bold.ttf $out/share/fonts/truetype/KohSantepheap-Bold.ttf
     install -Dm644 KohSantepheap-Black.ttf $out/share/fonts/truetype/KohSantepheap-Black.ttf
  '';

  meta = with lib; {
    description = "Koh Santepheap";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
