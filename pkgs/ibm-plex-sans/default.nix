{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-Thin.ttf?raw=true";
      name = "IBMPlexSans-Thin.ttf";
      sha256 = "f5e91036b6d793d33becce4ca40218920eee7fc9a6a8d156674996c286990fab";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-ThinItalic.ttf?raw=true";
      name = "IBMPlexSans-ThinItalic.ttf";
      sha256 = "f9cee8809c5403f9ba8a1ab1105239416bd8de4f4d4dd55284d17b475a0eb0ac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-ExtraLight.ttf?raw=true";
      name = "IBMPlexSans-ExtraLight.ttf";
      sha256 = "cb62a9a0d1d83ff9f00d13676df824e1b1175635d4631da7ab13fa71a896e7d9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexSans-ExtraLightItalic.ttf";
      sha256 = "27d618d182c4fa220d520e83bf0aeb1c9bece79c685262aa6070f9eb2eac7d78";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-Light.ttf?raw=true";
      name = "IBMPlexSans-Light.ttf";
      sha256 = "2f3651400f85b1d604935686b786862d9f9278606c04260bd6d63d690eb16a10";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-LightItalic.ttf?raw=true";
      name = "IBMPlexSans-LightItalic.ttf";
      sha256 = "742ea7fdf4caaa7929cd319475b2503d27be468f93bfa1eb148e02d98b266d32";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-Regular.ttf?raw=true";
      name = "IBMPlexSans-Regular.ttf";
      sha256 = "52babd121ff827c4f6ebbb20844d51569795eee6373580fc8979afc540048596";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-Italic.ttf?raw=true";
      name = "IBMPlexSans-Italic.ttf";
      sha256 = "c80122573572bd04056c0f82ea3e1c8b1df7922621f3a4b447915d519ccf706a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-Medium.ttf?raw=true";
      name = "IBMPlexSans-Medium.ttf";
      sha256 = "791716d014b493b533a4faee947b3bef6078f31ee9dacee719445357aa9c0e1b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-MediumItalic.ttf?raw=true";
      name = "IBMPlexSans-MediumItalic.ttf";
      sha256 = "7f218d51bd7ba75d3c526b172fc2b95f788506236d08fb419fdbce478a5e5c15";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-SemiBold.ttf?raw=true";
      name = "IBMPlexSans-SemiBold.ttf";
      sha256 = "76bd04cf3b2321586e668ecae60b73ecb5b86b4dc68bbbcdc6715ac6605f7783";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexSans-SemiBoldItalic.ttf";
      sha256 = "fb3ddc2f987dc683f69c711f7ab1ec2964294ca9a4fe14e32b794c327828510f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-Bold.ttf?raw=true";
      name = "IBMPlexSans-Bold.ttf";
      sha256 = "a20702eabc06feecafd8de9eec45ec2294353006e0c101acc3e6c70f4a52d997";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/e0b9f6ca2d88f7d6e89710ee06b17d53a21f6a22/ofl/ibmplexsans/IBMPlexSans-BoldItalic.ttf?raw=true";
      name = "IBMPlexSans-BoldItalic.ttf";
      sha256 = "59e201d9ffa61cce19153e94814676b4ba0bbf238cac442d75523ea15a5789b6";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSans-Thin.ttf $out/share/fonts/truetype/IBMPlexSans-Thin.ttf
     install -Dm644 IBMPlexSans-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexSans-ThinItalic.ttf
     install -Dm644 IBMPlexSans-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSans-ExtraLight.ttf
     install -Dm644 IBMPlexSans-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexSans-ExtraLightItalic.ttf
     install -Dm644 IBMPlexSans-Light.ttf $out/share/fonts/truetype/IBMPlexSans-Light.ttf
     install -Dm644 IBMPlexSans-LightItalic.ttf $out/share/fonts/truetype/IBMPlexSans-LightItalic.ttf
     install -Dm644 IBMPlexSans-Regular.ttf $out/share/fonts/truetype/IBMPlexSans-Regular.ttf
     install -Dm644 IBMPlexSans-Italic.ttf $out/share/fonts/truetype/IBMPlexSans-Italic.ttf
     install -Dm644 IBMPlexSans-Medium.ttf $out/share/fonts/truetype/IBMPlexSans-Medium.ttf
     install -Dm644 IBMPlexSans-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexSans-MediumItalic.ttf
     install -Dm644 IBMPlexSans-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSans-SemiBold.ttf
     install -Dm644 IBMPlexSans-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexSans-SemiBoldItalic.ttf
     install -Dm644 IBMPlexSans-Bold.ttf $out/share/fonts/truetype/IBMPlexSans-Bold.ttf
     install -Dm644 IBMPlexSans-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexSans-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
