{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "tomorrow-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Thin.ttf?raw=true";
      name = "Tomorrow-Thin.ttf";
      sha256 = "1f31e17daea5eb340b4104988b45848be568df0a7d8cff4caf3e6c668fcd1df3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-ThinItalic.ttf?raw=true";
      name = "Tomorrow-ThinItalic.ttf";
      sha256 = "dc2dc4737909d4ad6a7b9ca937bb9606cd7b1a525dd1b604a08a70f5ef152042";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-ExtraLight.ttf?raw=true";
      name = "Tomorrow-ExtraLight.ttf";
      sha256 = "4743cc9a6214fc8a92f84972f348ae7a37521803428e319da38c4188769863bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-ExtraLightItalic.ttf?raw=true";
      name = "Tomorrow-ExtraLightItalic.ttf";
      sha256 = "6629c77344425e9df21fbac82cdf949532ecc197975d93c31c554029aa40abea";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Light.ttf?raw=true";
      name = "Tomorrow-Light.ttf";
      sha256 = "5b9b59bc09eb7983717ae4a31beacbfad259f1c70fdff9203f174f506e645f11";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-LightItalic.ttf?raw=true";
      name = "Tomorrow-LightItalic.ttf";
      sha256 = "2e37e3fce108df08f5639d529a20b7fb5f3ad542694605cbc6572b81731bc803";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Regular.ttf?raw=true";
      name = "Tomorrow-Regular.ttf";
      sha256 = "6bb5534178637f472be093b2df876d580e7cb50df53e1a4b2be9f94070ff1767";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Italic.ttf?raw=true";
      name = "Tomorrow-Italic.ttf";
      sha256 = "6702f65c28bd3fc835aebe71edc1e862cd54a0bd78b81868aba98b89b1c627dc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Medium.ttf?raw=true";
      name = "Tomorrow-Medium.ttf";
      sha256 = "ed82147f4fdefa4a89cefdbeff0d6d0fc6af5a3fac073884918bfba846e5b88b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-MediumItalic.ttf?raw=true";
      name = "Tomorrow-MediumItalic.ttf";
      sha256 = "04258fbdda083701e8fe5af445eb2fbb540967aa118c76d9cf78c7a63d32094b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-SemiBold.ttf?raw=true";
      name = "Tomorrow-SemiBold.ttf";
      sha256 = "27f99342d00d33da5a5c89cf53e58a09a6e079d07511edbac9594713bd2368b6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-SemiBoldItalic.ttf?raw=true";
      name = "Tomorrow-SemiBoldItalic.ttf";
      sha256 = "44bef0383d3ae455aefa06e84935b80c439f3f661b5097367255a2119cf1c4f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Bold.ttf?raw=true";
      name = "Tomorrow-Bold.ttf";
      sha256 = "f024e7550a4c61583f19b12bf9f0730a91634c370549a87667b812376d6d858a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-BoldItalic.ttf?raw=true";
      name = "Tomorrow-BoldItalic.ttf";
      sha256 = "c30f681ba51129cd2d81a93d5a8a5c8262d2e535ae53e73a001d3d3770636038";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-ExtraBold.ttf?raw=true";
      name = "Tomorrow-ExtraBold.ttf";
      sha256 = "e7ea7979decf1bb60d83f28176cd5ba79667a9b66c7827023fcc7a787d88c435";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-ExtraBoldItalic.ttf?raw=true";
      name = "Tomorrow-ExtraBoldItalic.ttf";
      sha256 = "f7fe4bed14aaec1e25b1173c4eed35c3c5537e836c47db67b06189ec4adc7b19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-Black.ttf?raw=true";
      name = "Tomorrow-Black.ttf";
      sha256 = "50f588a001797ba6db023d00c1950cb33c983786d9e809c6e1473669ec2b167e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4d30c13bed90f08c655fbd6109c95f4b6c25a409/ofl/tomorrow/Tomorrow-BlackItalic.ttf?raw=true";
      name = "Tomorrow-BlackItalic.ttf";
      sha256 = "5eb9a4021dac271e6714b20998d5dfcf0b16856bf34044081a072a522b2b6167";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Tomorrow-Thin.ttf $out/share/fonts/truetype/Tomorrow-Thin.ttf
     install -Dm644 Tomorrow-ThinItalic.ttf $out/share/fonts/truetype/Tomorrow-ThinItalic.ttf
     install -Dm644 Tomorrow-ExtraLight.ttf $out/share/fonts/truetype/Tomorrow-ExtraLight.ttf
     install -Dm644 Tomorrow-ExtraLightItalic.ttf $out/share/fonts/truetype/Tomorrow-ExtraLightItalic.ttf
     install -Dm644 Tomorrow-Light.ttf $out/share/fonts/truetype/Tomorrow-Light.ttf
     install -Dm644 Tomorrow-LightItalic.ttf $out/share/fonts/truetype/Tomorrow-LightItalic.ttf
     install -Dm644 Tomorrow-Regular.ttf $out/share/fonts/truetype/Tomorrow-Regular.ttf
     install -Dm644 Tomorrow-Italic.ttf $out/share/fonts/truetype/Tomorrow-Italic.ttf
     install -Dm644 Tomorrow-Medium.ttf $out/share/fonts/truetype/Tomorrow-Medium.ttf
     install -Dm644 Tomorrow-MediumItalic.ttf $out/share/fonts/truetype/Tomorrow-MediumItalic.ttf
     install -Dm644 Tomorrow-SemiBold.ttf $out/share/fonts/truetype/Tomorrow-SemiBold.ttf
     install -Dm644 Tomorrow-SemiBoldItalic.ttf $out/share/fonts/truetype/Tomorrow-SemiBoldItalic.ttf
     install -Dm644 Tomorrow-Bold.ttf $out/share/fonts/truetype/Tomorrow-Bold.ttf
     install -Dm644 Tomorrow-BoldItalic.ttf $out/share/fonts/truetype/Tomorrow-BoldItalic.ttf
     install -Dm644 Tomorrow-ExtraBold.ttf $out/share/fonts/truetype/Tomorrow-ExtraBold.ttf
     install -Dm644 Tomorrow-ExtraBoldItalic.ttf $out/share/fonts/truetype/Tomorrow-ExtraBoldItalic.ttf
     install -Dm644 Tomorrow-Black.ttf $out/share/fonts/truetype/Tomorrow-Black.ttf
     install -Dm644 Tomorrow-BlackItalic.ttf $out/share/fonts/truetype/Tomorrow-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Tomorrow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
