{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-kr-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-ExtraLight.otf?raw=true";
      name = "NotoSerifKR-ExtraLight.otf";
      sha256 = "35319c00e415a894378bfe3fda3e83e354032f846908dc31d5f1cb4b11526a31";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-Light.otf?raw=true";
      name = "NotoSerifKR-Light.otf";
      sha256 = "379010d78c831cae9d737ea59dce0d2ddc74900a7ec0ef522a610aab4c0f7cd9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-Regular.otf?raw=true";
      name = "NotoSerifKR-Regular.otf";
      sha256 = "7a632fa7f20ee28f766925ae58dbc7442aa29b49f35151b746e5d5e913424ca3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-Medium.otf?raw=true";
      name = "NotoSerifKR-Medium.otf";
      sha256 = "6a24948f4ce13d8006f91e64e058d3065f2bb367746a9d2a4a1fb41effa1c21b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-SemiBold.otf?raw=true";
      name = "NotoSerifKR-SemiBold.otf";
      sha256 = "9ac1c404c54b8e2bb04152d69208ea2d83f3a16e5317ad97234f352ced18577e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-Bold.otf?raw=true";
      name = "NotoSerifKR-Bold.otf";
      sha256 = "e4529812ba430ac4a5fb0d68ef5fa3425131348ea62e4f7e9c8403f9dfb40386";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoserifkr/NotoSerifKR-Black.otf?raw=true";
      name = "NotoSerifKR-Black.otf";
      sha256 = "f590bc2ad04ad83ded9c9a6cb3c2219decb811a4fe02cbaf4b2150f9667ceeb9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifKR-ExtraLight.otf $out/share/fonts/opentype/NotoSerifKR-ExtraLight.otf
     install -Dm644 NotoSerifKR-Light.otf $out/share/fonts/opentype/NotoSerifKR-Light.otf
     install -Dm644 NotoSerifKR-Regular.otf $out/share/fonts/opentype/NotoSerifKR-Regular.otf
     install -Dm644 NotoSerifKR-Medium.otf $out/share/fonts/opentype/NotoSerifKR-Medium.otf
     install -Dm644 NotoSerifKR-SemiBold.otf $out/share/fonts/opentype/NotoSerifKR-SemiBold.otf
     install -Dm644 NotoSerifKR-Bold.otf $out/share/fonts/opentype/NotoSerifKR-Bold.otf
     install -Dm644 NotoSerifKR-Black.otf $out/share/fonts/opentype/NotoSerifKR-Black.otf
  '';

  meta = with lib; {
    description = "Noto Serif KR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
