{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-serif-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-Thin.ttf?raw=true";
      name = "IBMPlexSerif-Thin.ttf";
      sha256 = "1b4df73116dad2432f2d13337ae347fff71a03b8c1ba2b3e1c06cc98aadba72b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-ThinItalic.ttf?raw=true";
      name = "IBMPlexSerif-ThinItalic.ttf";
      sha256 = "772397765d3842e375712a277609783dc1c753653157de3c807c5390d6a1513d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-ExtraLight.ttf?raw=true";
      name = "IBMPlexSerif-ExtraLight.ttf";
      sha256 = "e70801926e16dd77c41f4a7c1099f6bab7140f489f03fb80856ec678820be60d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexSerif-ExtraLightItalic.ttf";
      sha256 = "f45aca4b4a1402c0c07c4a4665b278eb01aced90b6b719af29e8ae1a2a8bdc43";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-Light.ttf?raw=true";
      name = "IBMPlexSerif-Light.ttf";
      sha256 = "698bad1d5e52004cb1d504249bd704cf0aed03740d7ef22d7a533db2bc020f69";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-LightItalic.ttf?raw=true";
      name = "IBMPlexSerif-LightItalic.ttf";
      sha256 = "f4e4364e8fb60d9a0a4ed41e5bbe757672b042cdf2a963215035951782de8060";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-Regular.ttf?raw=true";
      name = "IBMPlexSerif-Regular.ttf";
      sha256 = "e882efa9c41949a528ac2369079ec5ef050c1c996bbd0bacce3c3326d44cf80d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-Italic.ttf?raw=true";
      name = "IBMPlexSerif-Italic.ttf";
      sha256 = "4b75b38be4673527231f49c48818d090c913d5042dd5c747b525bf6185d29ecb";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-Medium.ttf?raw=true";
      name = "IBMPlexSerif-Medium.ttf";
      sha256 = "32925e73e5b4a441df9d23e847f2b8c4046c1fc3db094e90bad8883157811509";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-MediumItalic.ttf?raw=true";
      name = "IBMPlexSerif-MediumItalic.ttf";
      sha256 = "a3b5c5b291db0b88abf833bd02864adcaa4ba994d9f7d9b790f552e2fd0cbabd";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-SemiBold.ttf?raw=true";
      name = "IBMPlexSerif-SemiBold.ttf";
      sha256 = "27ce4d105591b48f666b228e1e399838a704594efea22b730000951bea700a60";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexSerif-SemiBoldItalic.ttf";
      sha256 = "15f4e3974b83b2459a6a1b252caa356a9a11316deeba45adbc89b46fb4aab820";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-Bold.ttf?raw=true";
      name = "IBMPlexSerif-Bold.ttf";
      sha256 = "534c02c295999dd86e770457ece1d43db0de9256dd98bf741426f63ae904209e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b598f5e3ad6849188c9c71714b0fafe11dc88e02/ofl/ibmplexserif/IBMPlexSerif-BoldItalic.ttf?raw=true";
      name = "IBMPlexSerif-BoldItalic.ttf";
      sha256 = "2a32b76ac19c1942bf5942dbbd2a1566e5f1ae9833e421ebcf36d3522715e153";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSerif-Thin.ttf $out/share/fonts/truetype/IBMPlexSerif-Thin.ttf
     install -Dm644 IBMPlexSerif-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-ThinItalic.ttf
     install -Dm644 IBMPlexSerif-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSerif-ExtraLight.ttf
     install -Dm644 IBMPlexSerif-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-ExtraLightItalic.ttf
     install -Dm644 IBMPlexSerif-Light.ttf $out/share/fonts/truetype/IBMPlexSerif-Light.ttf
     install -Dm644 IBMPlexSerif-LightItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-LightItalic.ttf
     install -Dm644 IBMPlexSerif-Regular.ttf $out/share/fonts/truetype/IBMPlexSerif-Regular.ttf
     install -Dm644 IBMPlexSerif-Italic.ttf $out/share/fonts/truetype/IBMPlexSerif-Italic.ttf
     install -Dm644 IBMPlexSerif-Medium.ttf $out/share/fonts/truetype/IBMPlexSerif-Medium.ttf
     install -Dm644 IBMPlexSerif-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-MediumItalic.ttf
     install -Dm644 IBMPlexSerif-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSerif-SemiBold.ttf
     install -Dm644 IBMPlexSerif-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-SemiBoldItalic.ttf
     install -Dm644 IBMPlexSerif-Bold.ttf $out/share/fonts/truetype/IBMPlexSerif-Bold.ttf
     install -Dm644 IBMPlexSerif-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexSerif-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Serif";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
