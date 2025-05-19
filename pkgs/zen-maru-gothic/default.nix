{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-maru-gothic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenmarugothic/ZenMaruGothic-Light.ttf?raw=true";
      name = "ZenMaruGothic-Light.ttf";
      sha256 = "c4e6fa10ff517df37cb0c13038fe2813f3c47afe6577fa4a5573200e4508b2c1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenmarugothic/ZenMaruGothic-Regular.ttf?raw=true";
      name = "ZenMaruGothic-Regular.ttf";
      sha256 = "a0c0b53543e0993ae2225e629c833f3d51495ad31720694ff112ce4ce11111ef";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenmarugothic/ZenMaruGothic-Medium.ttf?raw=true";
      name = "ZenMaruGothic-Medium.ttf";
      sha256 = "3cfdb98a13571ede17fcc769f5093a97c38b80a7b9b2ab754a26b4d822092b3b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenmarugothic/ZenMaruGothic-Bold.ttf?raw=true";
      name = "ZenMaruGothic-Bold.ttf";
      sha256 = "fe24426b9c8b5523a0146a8235c8674eccf0493af354a53ec895c3596d9eb745";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/zenmarugothic/ZenMaruGothic-Black.ttf?raw=true";
      name = "ZenMaruGothic-Black.ttf";
      sha256 = "6bd74fe76cd39ee0ec18775c3661d845343fb3f6f8fa09a3076638417baf741f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenMaruGothic-Light.ttf $out/share/fonts/truetype/ZenMaruGothic-Light.ttf
     install -Dm644 ZenMaruGothic-Regular.ttf $out/share/fonts/truetype/ZenMaruGothic-Regular.ttf
     install -Dm644 ZenMaruGothic-Medium.ttf $out/share/fonts/truetype/ZenMaruGothic-Medium.ttf
     install -Dm644 ZenMaruGothic-Bold.ttf $out/share/fonts/truetype/ZenMaruGothic-Bold.ttf
     install -Dm644 ZenMaruGothic-Black.ttf $out/share/fonts/truetype/ZenMaruGothic-Black.ttf
  '';

  meta = with lib; {
    description = "Zen Maru Gothic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
