{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "source-serif-pro-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-ExtraLight.ttf?raw=true";
      name = "SourceSerifPro-ExtraLight.ttf";
      sha256 = "803a193ae3ee2c7cd28c58c94d45127cc41b25b02a04e7d184341ade7ad8e5c8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-ExtraLightItalic.ttf?raw=true";
      name = "SourceSerifPro-ExtraLightItalic.ttf";
      sha256 = "63cdce26f4b317bd9f075e629bf54bdc2d453d7ef93bc0993c80a90dab9179b8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-Light.ttf?raw=true";
      name = "SourceSerifPro-Light.ttf";
      sha256 = "4230b332164cf94d4d5150c579ccc7a571525b0d8ae482452edfd1fb9d1fa0db";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-LightItalic.ttf?raw=true";
      name = "SourceSerifPro-LightItalic.ttf";
      sha256 = "8e68a17854172c5f16830b1e0bae9fd20905509c261c8246f72da0077852200c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-Regular.ttf?raw=true";
      name = "SourceSerifPro-Regular.ttf";
      sha256 = "4eb0d346de8ef092800db6b49a426afb8abd95c875d6a392e35f53ab8254ea62";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-Italic.ttf?raw=true";
      name = "SourceSerifPro-Italic.ttf";
      sha256 = "a8ccc55ed2a7304a03d001d48b73382f739e0fe5f805533f54a3adb32049c82a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-SemiBold.ttf?raw=true";
      name = "SourceSerifPro-SemiBold.ttf";
      sha256 = "0de9f1ccb2745b0761f2200749f8fe58f68d272f50c845747b351fc94da4edfa";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-SemiBoldItalic.ttf?raw=true";
      name = "SourceSerifPro-SemiBoldItalic.ttf";
      sha256 = "d46c0e030a0f08fd18c70e62c5950ab37500363e75d9b90c7b74241922948211";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-Bold.ttf?raw=true";
      name = "SourceSerifPro-Bold.ttf";
      sha256 = "894ce53379baf2c0036ef60528dbd0aeba568d9c0d78f43417cf175fb52655c8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-BoldItalic.ttf?raw=true";
      name = "SourceSerifPro-BoldItalic.ttf";
      sha256 = "5ca368d56229a606e840a4432808174dbf5f3c16bf2838d2ab0459eb8614348c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-Black.ttf?raw=true";
      name = "SourceSerifPro-Black.ttf";
      sha256 = "3445b5253de87c466a8f7137182cb454862520305868fd7ba568e8e972c3f895";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/1afe12072a7fff0c8eaacb36fa4c8c722192d5e7/ofl/sourceserifpro/SourceSerifPro-BlackItalic.ttf?raw=true";
      name = "SourceSerifPro-BlackItalic.ttf";
      sha256 = "1fdf5660ad04209a6743d5f1062c9ed9b777a1481d92ed4f05dd9bad8b564016";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SourceSerifPro-ExtraLight.ttf $out/share/fonts/truetype/SourceSerifPro-ExtraLight.ttf
     install -Dm644 SourceSerifPro-ExtraLightItalic.ttf $out/share/fonts/truetype/SourceSerifPro-ExtraLightItalic.ttf
     install -Dm644 SourceSerifPro-Light.ttf $out/share/fonts/truetype/SourceSerifPro-Light.ttf
     install -Dm644 SourceSerifPro-LightItalic.ttf $out/share/fonts/truetype/SourceSerifPro-LightItalic.ttf
     install -Dm644 SourceSerifPro-Regular.ttf $out/share/fonts/truetype/SourceSerifPro-Regular.ttf
     install -Dm644 SourceSerifPro-Italic.ttf $out/share/fonts/truetype/SourceSerifPro-Italic.ttf
     install -Dm644 SourceSerifPro-SemiBold.ttf $out/share/fonts/truetype/SourceSerifPro-SemiBold.ttf
     install -Dm644 SourceSerifPro-SemiBoldItalic.ttf $out/share/fonts/truetype/SourceSerifPro-SemiBoldItalic.ttf
     install -Dm644 SourceSerifPro-Bold.ttf $out/share/fonts/truetype/SourceSerifPro-Bold.ttf
     install -Dm644 SourceSerifPro-BoldItalic.ttf $out/share/fonts/truetype/SourceSerifPro-BoldItalic.ttf
     install -Dm644 SourceSerifPro-Black.ttf $out/share/fonts/truetype/SourceSerifPro-Black.ttf
     install -Dm644 SourceSerifPro-BlackItalic.ttf $out/share/fonts/truetype/SourceSerifPro-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Source Serif Pro";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
