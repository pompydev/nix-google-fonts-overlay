{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "noto-serif-tc-${version}";
  version = "2022-03-09-183858";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-ExtraLight.otf?raw=true";
      name = "NotoSerifTC-ExtraLight.otf";
      sha256 = "b1bb7aceaa393340358b380dc1d2dda937e4b9ef62411bd23c3979041fca763d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-Light.otf?raw=true";
      name = "NotoSerifTC-Light.otf";
      sha256 = "fbddb40da26e0e904f0dd0ab565b1a17452861b5b5bca8a00c5f68c432b1368f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-Regular.otf?raw=true";
      name = "NotoSerifTC-Regular.otf";
      sha256 = "b8234e785ecf9029b84feee0515efc465330f0ede25c45d3f75132b5ffbceaad";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-Medium.otf?raw=true";
      name = "NotoSerifTC-Medium.otf";
      sha256 = "56a603cb781c74ef5f4a1de2b660bc8e16cdb7e01d52053f2adca67b2f241646";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-SemiBold.otf?raw=true";
      name = "NotoSerifTC-SemiBold.otf";
      sha256 = "68723eb9790a5d0d1cf3515d2342ed86412d96ec2ad0c0d0b0fe4ef24528af86";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-Bold.otf?raw=true";
      name = "NotoSerifTC-Bold.otf";
      sha256 = "00df336fa2d8fc249d689c583b5297b5d4b4a3b782b7027dcb63a85d284a3f20";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/beff1d8226e598dfaf06f9f8312c01021f70e9d2/ofl/notoseriftc/NotoSerifTC-Black.otf?raw=true";
      name = "NotoSerifTC-Black.otf";
      sha256 = "836bfe644e7fa205dcd5f66c6a5c066759399b2d8d1ac9f5df753e95a1ed81a3";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 NotoSerifTC-ExtraLight.otf $out/share/fonts/opentype/NotoSerifTC-ExtraLight.otf
     install -Dm644 NotoSerifTC-Light.otf $out/share/fonts/opentype/NotoSerifTC-Light.otf
     install -Dm644 NotoSerifTC-Regular.otf $out/share/fonts/opentype/NotoSerifTC-Regular.otf
     install -Dm644 NotoSerifTC-Medium.otf $out/share/fonts/opentype/NotoSerifTC-Medium.otf
     install -Dm644 NotoSerifTC-SemiBold.otf $out/share/fonts/opentype/NotoSerifTC-SemiBold.otf
     install -Dm644 NotoSerifTC-Bold.otf $out/share/fonts/opentype/NotoSerifTC-Bold.otf
     install -Dm644 NotoSerifTC-Black.otf $out/share/fonts/opentype/NotoSerifTC-Black.otf
  '';

  meta = with lib; {
    description = "Noto Serif TC";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
