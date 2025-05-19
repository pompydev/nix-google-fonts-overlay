{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-sans-oriya-ui-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoriyaui/NotoSansOriyaUI-Thin.ttf?raw=true";
      name = "NotoSansOriyaUI-Thin.ttf";
      sha256 = "7fea1870b88536a0e6efb66dc862993629036334b425e8966c1b3cee21d9f887";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoriyaui/NotoSansOriyaUI-Regular.ttf?raw=true";
      name = "NotoSansOriyaUI-Regular.ttf";
      sha256 = "2d151a5c2c9fb01a6cbe767f200b263d090d88bf6a74880f43ed81c211e51fb2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoriyaui/NotoSansOriyaUI-Bold.ttf?raw=true";
      name = "NotoSansOriyaUI-Bold.ttf";
      sha256 = "0083e64c0b67116b8ecc920c0284301971c9099bf33a383eb38fd42e29476fa4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/notosansoriyaui/NotoSansOriyaUI-Black.ttf?raw=true";
      name = "NotoSansOriyaUI-Black.ttf";
      sha256 = "ba5174bfd33278d3d28cf092ae64e3bdedeba0ad8cf8cfa6b4338b3556712b8b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSansOriyaUI-Thin.ttf $out/share/fonts/truetype/NotoSansOriyaUI-Thin.ttf
     install -Dm644 NotoSansOriyaUI-Regular.ttf $out/share/fonts/truetype/NotoSansOriyaUI-Regular.ttf
     install -Dm644 NotoSansOriyaUI-Bold.ttf $out/share/fonts/truetype/NotoSansOriyaUI-Bold.ttf
     install -Dm644 NotoSansOriyaUI-Black.ttf $out/share/fonts/truetype/NotoSansOriyaUI-Black.ttf
  '';

  meta = with lib; {
    description = "Noto Sans Oriya UI";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
