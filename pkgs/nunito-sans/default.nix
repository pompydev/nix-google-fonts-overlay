{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "nunito-sans-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-ExtraLight.ttf?raw=true";
      name = "NunitoSans-ExtraLight.ttf";
      sha256 = "d3e68453bc7ef37e1c684cb408d0d38386ded50af065843ccbbe93ef26844913";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-ExtraLightItalic.ttf?raw=true";
      name = "NunitoSans-ExtraLightItalic.ttf";
      sha256 = "8f9f09f2fad368cb5ea9cb5ff8ff9e0a23504efe790ccf0e9eea530888bee43b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-Light.ttf?raw=true";
      name = "NunitoSans-Light.ttf";
      sha256 = "3df1ac568f1d9f4a1aff71f0c72bf340c18f9a247648bf470cd528a3b8ebfdb7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-LightItalic.ttf?raw=true";
      name = "NunitoSans-LightItalic.ttf";
      sha256 = "9276286683bade29e1f03bd55f96b87ffdd738daf529f0191ff2bda69d3274da";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-Regular.ttf?raw=true";
      name = "NunitoSans-Regular.ttf";
      sha256 = "b26d1677f7776c8a07fd87a83db3a6fdc7486bb627332c73ec8b6c37d9416834";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-Italic.ttf?raw=true";
      name = "NunitoSans-Italic.ttf";
      sha256 = "456214f2a2743714d80367be43a00dedf45018e215c232fb9204e8dde50ba0a0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-SemiBold.ttf?raw=true";
      name = "NunitoSans-SemiBold.ttf";
      sha256 = "e51e66d6a3e519f70b76a156066182406e464b1e8731fba28d16372b6b03fab0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-SemiBoldItalic.ttf?raw=true";
      name = "NunitoSans-SemiBoldItalic.ttf";
      sha256 = "0c585b4ef9c8049bae908b61656d28604f5c4964fc41ce4b76ec57ef7b2e6efd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-Bold.ttf?raw=true";
      name = "NunitoSans-Bold.ttf";
      sha256 = "4f4f1043f1fe2c44bb00d305dfa7084befd08e25d6be39e6b2383e1b8b874791";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-BoldItalic.ttf?raw=true";
      name = "NunitoSans-BoldItalic.ttf";
      sha256 = "dbfa5f91b69753f98b6a28b4cc9ac0c7954bf04a55d8061d99d8057570b83851";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-ExtraBold.ttf?raw=true";
      name = "NunitoSans-ExtraBold.ttf";
      sha256 = "aa2a5c1cb55b1681ea978ae6c3e9d194e5352230e8e49761a3a95f9dba85ad44";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-ExtraBoldItalic.ttf?raw=true";
      name = "NunitoSans-ExtraBoldItalic.ttf";
      sha256 = "52620d3dd80f0dbd5a4e1ec22f429259e5a526f778c6a7a9b9e45ae756380f30";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-Black.ttf?raw=true";
      name = "NunitoSans-Black.ttf";
      sha256 = "9306e907161cb7feb3358612b1b8a58c4dfdda58ac8a3def46406ebf58dab0d7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/dd96d4f0acd2b76027c3fe3926a214b0c4d40645/ofl/nunitosans/NunitoSans-BlackItalic.ttf?raw=true";
      name = "NunitoSans-BlackItalic.ttf";
      sha256 = "2ba5da5ec3079525728aa938dbd9cdb5abddc9498bf1df8f2ab94f36be5c05a8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NunitoSans-ExtraLight.ttf $out/share/fonts/truetype/NunitoSans-ExtraLight.ttf
     install -Dm644 NunitoSans-ExtraLightItalic.ttf $out/share/fonts/truetype/NunitoSans-ExtraLightItalic.ttf
     install -Dm644 NunitoSans-Light.ttf $out/share/fonts/truetype/NunitoSans-Light.ttf
     install -Dm644 NunitoSans-LightItalic.ttf $out/share/fonts/truetype/NunitoSans-LightItalic.ttf
     install -Dm644 NunitoSans-Regular.ttf $out/share/fonts/truetype/NunitoSans-Regular.ttf
     install -Dm644 NunitoSans-Italic.ttf $out/share/fonts/truetype/NunitoSans-Italic.ttf
     install -Dm644 NunitoSans-SemiBold.ttf $out/share/fonts/truetype/NunitoSans-SemiBold.ttf
     install -Dm644 NunitoSans-SemiBoldItalic.ttf $out/share/fonts/truetype/NunitoSans-SemiBoldItalic.ttf
     install -Dm644 NunitoSans-Bold.ttf $out/share/fonts/truetype/NunitoSans-Bold.ttf
     install -Dm644 NunitoSans-BoldItalic.ttf $out/share/fonts/truetype/NunitoSans-BoldItalic.ttf
     install -Dm644 NunitoSans-ExtraBold.ttf $out/share/fonts/truetype/NunitoSans-ExtraBold.ttf
     install -Dm644 NunitoSans-ExtraBoldItalic.ttf $out/share/fonts/truetype/NunitoSans-ExtraBoldItalic.ttf
     install -Dm644 NunitoSans-Black.ttf $out/share/fonts/truetype/NunitoSans-Black.ttf
     install -Dm644 NunitoSans-BlackItalic.ttf $out/share/fonts/truetype/NunitoSans-BlackItalic.ttf
  '';

  meta = with lib; {
    description = "Nunito Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
