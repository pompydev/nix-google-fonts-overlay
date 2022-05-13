{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-sc-${version}";
  version = "2022-04-25-165019";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-ExtraLight.otf?raw=true";
      name = "NotoSerifSC-ExtraLight.otf";
      sha256 = "9bf32a606c63efd0691b83238b3d7cc76040f7417f4034efb321c54bd314487e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-Light.otf?raw=true";
      name = "NotoSerifSC-Light.otf";
      sha256 = "9c76934065c35551a7571f7cc576c4bd94b3078e85e5a4dc1223fa3e0da83cf8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-Regular.otf?raw=true";
      name = "NotoSerifSC-Regular.otf";
      sha256 = "1416501fd3f3f913ebb40310f9fbee337cd24bea1b3129e144b3cf9adc238340";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-Medium.otf?raw=true";
      name = "NotoSerifSC-Medium.otf";
      sha256 = "a8f7ef69e54d17b3b1d20c28e915b05a5111aaa1f539554a52f4c5aa7bc008b3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-SemiBold.otf?raw=true";
      name = "NotoSerifSC-SemiBold.otf";
      sha256 = "202e6548396f32c7c3c147f82b5687d1e81c8b24b6e0fc405e460d044a059b61";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-Bold.otf?raw=true";
      name = "NotoSerifSC-Bold.otf";
      sha256 = "733ac698775c8002b563abac2c4f108712c1e59652ed08fbe974a7e1cc639dd4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifsc/NotoSerifSC-Black.otf?raw=true";
      name = "NotoSerifSC-Black.otf";
      sha256 = "609d2afbbf4e7286bafa7b24c294df85280980e2ff48461a26bf19f2302e7525";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifSC-ExtraLight.otf $out/share/fonts/opentype/NotoSerifSC-ExtraLight.otf
     install -Dm644 NotoSerifSC-Light.otf $out/share/fonts/opentype/NotoSerifSC-Light.otf
     install -Dm644 NotoSerifSC-Regular.otf $out/share/fonts/opentype/NotoSerifSC-Regular.otf
     install -Dm644 NotoSerifSC-Medium.otf $out/share/fonts/opentype/NotoSerifSC-Medium.otf
     install -Dm644 NotoSerifSC-SemiBold.otf $out/share/fonts/opentype/NotoSerifSC-SemiBold.otf
     install -Dm644 NotoSerifSC-Bold.otf $out/share/fonts/opentype/NotoSerifSC-Bold.otf
     install -Dm644 NotoSerifSC-Black.otf $out/share/fonts/opentype/NotoSerifSC-Black.otf
  '';

  meta = with lib; {
    description = "Noto Serif SC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
