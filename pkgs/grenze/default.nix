{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "grenze-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Thin.ttf?raw=true";
      name = "Grenze-Thin.ttf";
      sha256 = "9b217c1eeab37a0e1811608eb25c5bd303834c864a868aa295e4a519d5a5f111";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-ThinItalic.ttf?raw=true";
      name = "Grenze-ThinItalic.ttf";
      sha256 = "448780c30dd17b240cf3c55e49c5dd3d85b3343bbbb8a733239bf098cd5854fd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-ExtraLight.ttf?raw=true";
      name = "Grenze-ExtraLight.ttf";
      sha256 = "e28cd3a7ce91fba018399f620b9058203d7d5a5055c1d4e8b981bcfeb9bc3110";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-ExtraLightItalic.ttf?raw=true";
      name = "Grenze-ExtraLightItalic.ttf";
      sha256 = "8bb44c21bd90e69cdb2b769956e9e1f70568b38a46780cb241e9c8b84c3d6c40";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Light.ttf?raw=true";
      name = "Grenze-Light.ttf";
      sha256 = "b49b8f940efa022ea7339c0f15bf486010f47e6eea87a1bae0ff2be1faf9480a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-LightItalic.ttf?raw=true";
      name = "Grenze-LightItalic.ttf";
      sha256 = "448cc18abfc44ea79e5612835fa09a29a2b47af6a6206838c67c8075ea607f6c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Regular.ttf?raw=true";
      name = "Grenze-Regular.ttf";
      sha256 = "a2fd97e65d3cb1ae16b21c02f45f320e49895333754da27bc92d235eec84832e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Italic.ttf?raw=true";
      name = "Grenze-Italic.ttf";
      sha256 = "70fbb7f56996747fedf7c37e37d4232c5629e889d89eee3125f0c7d56bdf9b7b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Medium.ttf?raw=true";
      name = "Grenze-Medium.ttf";
      sha256 = "472f282cebf4f667e9ac591c14edbe8e1e6ce2d6b2ad5c44dd803d968b9a14db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-MediumItalic.ttf?raw=true";
      name = "Grenze-MediumItalic.ttf";
      sha256 = "84ec63b40c64273016b841a2928e877ec1791bf5fad78c45c642e0ae4b2ff699";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-SemiBold.ttf?raw=true";
      name = "Grenze-SemiBold.ttf";
      sha256 = "f8197355ae494f676d2cb6f14466955d67f0f856d255ea9c14b7b75df98c1613";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-SemiBoldItalic.ttf?raw=true";
      name = "Grenze-SemiBoldItalic.ttf";
      sha256 = "f907f0c73726ef9bd9d394b0cf99a01b9293425ea5ddea37e6aaa95c09fbe95f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Bold.ttf?raw=true";
      name = "Grenze-Bold.ttf";
      sha256 = "2efe90e425bc15f87597d2dd6ef0ac5820d67aea88221ba76cab351d7ee5baa2";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-BoldItalic.ttf?raw=true";
      name = "Grenze-BoldItalic.ttf";
      sha256 = "7d74560f8b7cf19e4b43f9ebd02dbd8857edcabdcdbea438f458094541467c42";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-ExtraBold.ttf?raw=true";
      name = "Grenze-ExtraBold.ttf";
      sha256 = "acbc06cf687e219a3331624a328064b85a82d33ca3906ebb2d4425e1e8126607";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-ExtraBoldItalic.ttf?raw=true";
      name = "Grenze-ExtraBoldItalic.ttf";
      sha256 = "4ed1c0efe549aedeac7551b8ac3ac637be6fb97243eb74fd75caa3853a36198b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-Black.ttf?raw=true";
      name = "Grenze-Black.ttf";
      sha256 = "199f5a31ebd24a91376c43ab9dac3480c6b7a5158c1077e845d652b6cb947ae8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/grenze/Grenze-BlackItalic.ttf?raw=true";
      name = "Grenze-BlackItalic.ttf";
      sha256 = "fc257d614d5a8545dd43e07daef2cbf8cedd5d58c47a3671f1619941eeed154e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Grenze-Thin.ttf $out/share/fonts/truetype/Grenze-Thin.ttf
     install -Dm644 Grenze-ThinItalic.ttf $out/share/fonts/truetype/Grenze-ThinItalic.ttf
     install -Dm644 Grenze-ExtraLight.ttf $out/share/fonts/truetype/Grenze-ExtraLight.ttf
     install -Dm644 Grenze-ExtraLightItalic.ttf $out/share/fonts/truetype/Grenze-ExtraLightItalic.ttf
     install -Dm644 Grenze-Light.ttf $out/share/fonts/truetype/Grenze-Light.ttf
     install -Dm644 Grenze-LightItalic.ttf $out/share/fonts/truetype/Grenze-LightItalic.ttf
     install -Dm644 Grenze-Regular.ttf $out/share/fonts/truetype/Grenze-Regular.ttf
     install -Dm644 Grenze-Italic.ttf $out/share/fonts/truetype/Grenze-Italic.ttf
     install -Dm644 Grenze-Medium.ttf $out/share/fonts/truetype/Grenze-Medium.ttf
     install -Dm644 Grenze-MediumItalic.ttf $out/share/fonts/truetype/Grenze-MediumItalic.ttf
     install -Dm644 Grenze-SemiBold.ttf $out/share/fonts/truetype/Grenze-SemiBold.ttf
     install -Dm644 Grenze-SemiBoldItalic.ttf $out/share/fonts/truetype/Grenze-SemiBoldItalic.ttf
     install -Dm644 Grenze-Bold.ttf $out/share/fonts/truetype/Grenze-Bold.ttf
     install -Dm644 Grenze-BoldItalic.ttf $out/share/fonts/truetype/Grenze-BoldItalic.ttf
     install -Dm644 Grenze-ExtraBold.ttf $out/share/fonts/truetype/Grenze-ExtraBold.ttf
     install -Dm644 Grenze-ExtraBoldItalic.ttf $out/share/fonts/truetype/Grenze-ExtraBoldItalic.ttf
     install -Dm644 Grenze-Black.ttf $out/share/fonts/truetype/Grenze-Black.ttf
     install -Dm644 Grenze-BlackItalic.ttf $out/share/fonts/truetype/Grenze-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Grenze";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
