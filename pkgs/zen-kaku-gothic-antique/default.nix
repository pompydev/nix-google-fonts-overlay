{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "zen-kaku-gothic-antique-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8f2790b12018153309b61335c4887ce939fde37/ofl/zenkakugothicantique/ZenKakuGothicAntique-Light.ttf?raw=true";
      name = "ZenKakuGothicAntique-Light.ttf";
      sha256 = "1f4fd2ad3f837f4b14cda167da22aee86ad3ade20a6ff8aa931360d4676b7b66";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8f2790b12018153309b61335c4887ce939fde37/ofl/zenkakugothicantique/ZenKakuGothicAntique-Regular.ttf?raw=true";
      name = "ZenKakuGothicAntique-Regular.ttf";
      sha256 = "e79b874ef1ae0cfe5b9d750f5990d408874300b17c7a02cb6e86e73a14a33005";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8f2790b12018153309b61335c4887ce939fde37/ofl/zenkakugothicantique/ZenKakuGothicAntique-Medium.ttf?raw=true";
      name = "ZenKakuGothicAntique-Medium.ttf";
      sha256 = "02bdc45744fd357b04c1a8fb0f2392a8c31b3a9250acb9899252a933ec66f4b6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8f2790b12018153309b61335c4887ce939fde37/ofl/zenkakugothicantique/ZenKakuGothicAntique-Bold.ttf?raw=true";
      name = "ZenKakuGothicAntique-Bold.ttf";
      sha256 = "c0c631a6a4e51d4c29c8c84c40fca30b820e966d9a521c039029a19b4e438c29";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b8f2790b12018153309b61335c4887ce939fde37/ofl/zenkakugothicantique/ZenKakuGothicAntique-Black.ttf?raw=true";
      name = "ZenKakuGothicAntique-Black.ttf";
      sha256 = "a7283b2e53d78ed1368f3b73c54410d3fbeb9f0e2e9da93b6c2c67a1e7c2900a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ZenKakuGothicAntique-Light.ttf $out/share/fonts/truetype/ZenKakuGothicAntique-Light.ttf
     install -Dm644 ZenKakuGothicAntique-Regular.ttf $out/share/fonts/truetype/ZenKakuGothicAntique-Regular.ttf
     install -Dm644 ZenKakuGothicAntique-Medium.ttf $out/share/fonts/truetype/ZenKakuGothicAntique-Medium.ttf
     install -Dm644 ZenKakuGothicAntique-Bold.ttf $out/share/fonts/truetype/ZenKakuGothicAntique-Bold.ttf
     install -Dm644 ZenKakuGothicAntique-Black.ttf $out/share/fonts/truetype/ZenKakuGothicAntique-Black.ttf
  '';

  meta = with lib; {
    description = "Zen Kaku Gothic Antique";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
