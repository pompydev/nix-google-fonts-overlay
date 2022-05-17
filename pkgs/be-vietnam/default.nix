{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "be-vietnam-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-Thin.ttf?raw=true";
      name = "BeVietnam-Thin.ttf";
      sha256 = "44a41296ed810207d46aa389516641ac649453f51a46a358fd1c198d41d7f9d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-ThinItalic.ttf?raw=true";
      name = "BeVietnam-ThinItalic.ttf";
      sha256 = "09beef93b26da0d659e454507a4e04465ed369b7d09f8218c87455313b356a1e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-Light.ttf?raw=true";
      name = "BeVietnam-Light.ttf";
      sha256 = "0e1ff5a6259cba61bb250966428453ee385a03d9ea8d7e3fefcdce789ede5064";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-LightItalic.ttf?raw=true";
      name = "BeVietnam-LightItalic.ttf";
      sha256 = "9f2f83ad64e919f52976fbcee1d8ad7b0f22c2c9d24a43ca48291cb117600795";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-Regular.ttf?raw=true";
      name = "BeVietnam-Regular.ttf";
      sha256 = "5cce1cc8cd76b9cd368f525a2c97d5ae123ce01c1d4b0bb097c084d728191534";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-Italic.ttf?raw=true";
      name = "BeVietnam-Italic.ttf";
      sha256 = "50402fd69c6a481ac21341450eae9f3b830a551adfb333db8705d0a5e91c21bd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-Medium.ttf?raw=true";
      name = "BeVietnam-Medium.ttf";
      sha256 = "9344f231cba6c57658e45c7cb31c858e672b97ebf40ec4c4948ce34f0b1ae5ce";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-MediumItalic.ttf?raw=true";
      name = "BeVietnam-MediumItalic.ttf";
      sha256 = "34224d411e0d104a4ca7198c9554031fa9eb6c5d1f675e93e7216d69dcb6e9c3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-SemiBold.ttf?raw=true";
      name = "BeVietnam-SemiBold.ttf";
      sha256 = "5bc3e2bbc9849b118d42a185fc1ef58654ac6b764a0e423c51ea6e8bf6b9a6a5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-SemiBoldItalic.ttf?raw=true";
      name = "BeVietnam-SemiBoldItalic.ttf";
      sha256 = "e3af068ca5af34ed0b2a3b3c7950a75a5d078edc85f71ebb6cc6ad6eedd8a2f8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-Bold.ttf?raw=true";
      name = "BeVietnam-Bold.ttf";
      sha256 = "3805e2324c65bb782320ded5c6917b6e10dc739b1c223bc1d71ba3f130bcb9cf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-BoldItalic.ttf?raw=true";
      name = "BeVietnam-BoldItalic.ttf";
      sha256 = "d7c84230bcbd82becd10135aa4981874d651500eb04b22cde23ec84c00aa149e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-ExtraBold.ttf?raw=true";
      name = "BeVietnam-ExtraBold.ttf";
      sha256 = "4032e749280bc64c112d65b69ace3e632365ac521aa0d7ddec7d92f003129062";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/184638ed4cf9231c89e47e8571c608af0d8a347e/ofl/bevietnam/BeVietnam-ExtraBoldItalic.ttf?raw=true";
      name = "BeVietnam-ExtraBoldItalic.ttf";
      sha256 = "ddf167ccd367fdd81006e14e18367f7422eb3a1c011eedd12b5c6daf8c52c570";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BeVietnam-Thin.ttf $out/share/fonts/truetype/BeVietnam-Thin.ttf
     install -Dm644 BeVietnam-ThinItalic.ttf $out/share/fonts/truetype/BeVietnam-ThinItalic.ttf
     install -Dm644 BeVietnam-Light.ttf $out/share/fonts/truetype/BeVietnam-Light.ttf
     install -Dm644 BeVietnam-LightItalic.ttf $out/share/fonts/truetype/BeVietnam-LightItalic.ttf
     install -Dm644 BeVietnam-Regular.ttf $out/share/fonts/truetype/BeVietnam-Regular.ttf
     install -Dm644 BeVietnam-Italic.ttf $out/share/fonts/truetype/BeVietnam-Italic.ttf
     install -Dm644 BeVietnam-Medium.ttf $out/share/fonts/truetype/BeVietnam-Medium.ttf
     install -Dm644 BeVietnam-MediumItalic.ttf $out/share/fonts/truetype/BeVietnam-MediumItalic.ttf
     install -Dm644 BeVietnam-SemiBold.ttf $out/share/fonts/truetype/BeVietnam-SemiBold.ttf
     install -Dm644 BeVietnam-SemiBoldItalic.ttf $out/share/fonts/truetype/BeVietnam-SemiBoldItalic.ttf
     install -Dm644 BeVietnam-Bold.ttf $out/share/fonts/truetype/BeVietnam-Bold.ttf
     install -Dm644 BeVietnam-BoldItalic.ttf $out/share/fonts/truetype/BeVietnam-BoldItalic.ttf
     install -Dm644 BeVietnam-ExtraBold.ttf $out/share/fonts/truetype/BeVietnam-ExtraBold.ttf
     install -Dm644 BeVietnam-ExtraBoldItalic.ttf $out/share/fonts/truetype/BeVietnam-ExtraBoldItalic.ttf
  '';

  meta = with lib; {
    description = "Be Vietnam";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
