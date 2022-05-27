{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-mono-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-Thin.ttf?raw=true";
      name = "IBMPlexMono-Thin.ttf";
      sha256 = "819f91964f0278aba26006335364799f69e918a22e8e96ca816ed58517b3bf81";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-ThinItalic.ttf?raw=true";
      name = "IBMPlexMono-ThinItalic.ttf";
      sha256 = "a6d4122648008e0adad76e8894dcf34afb0cad318551850889ddb2516998e630";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-ExtraLight.ttf?raw=true";
      name = "IBMPlexMono-ExtraLight.ttf";
      sha256 = "56c2e96bb7fb5ea022a4d9a9033b1f6b59bac5b67c70be70c66b803718ecd973";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexMono-ExtraLightItalic.ttf";
      sha256 = "0d78c7b88cc963d01ca6ac330fceab20e91d60ab56efe247ba1d838cff88039c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-Light.ttf?raw=true";
      name = "IBMPlexMono-Light.ttf";
      sha256 = "f9ccc27f8490af40eb441ed3a289cef9ac1bd0cd43a57fb18748d4a08bc7e5f0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-LightItalic.ttf?raw=true";
      name = "IBMPlexMono-LightItalic.ttf";
      sha256 = "3f5c6705eb06a909ebdb8654900f1df4460c7ee592077e78a1dbf00524e5acc9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-Regular.ttf?raw=true";
      name = "IBMPlexMono-Regular.ttf";
      sha256 = "9ff9ab66aaa412874bd24bdfa7be5c1d600abb9937eb7f931bfd409fe6217936";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-Italic.ttf?raw=true";
      name = "IBMPlexMono-Italic.ttf";
      sha256 = "b00001f508df62c18f2f13de8d7043c75b6c2e6a2d820923e63bc29f31fbb747";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-Medium.ttf?raw=true";
      name = "IBMPlexMono-Medium.ttf";
      sha256 = "3850fc773dc6a9b1723f3517d9d1052fccf407476650b7d3f74a06294bf2d961";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-MediumItalic.ttf?raw=true";
      name = "IBMPlexMono-MediumItalic.ttf";
      sha256 = "2eaebfaf1df0b238cbd56eb9bbc75d422a783e65c7eb48a651d276d7123851a8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-SemiBold.ttf?raw=true";
      name = "IBMPlexMono-SemiBold.ttf";
      sha256 = "0a36dc8c4738ef2e3d8e7f353ed1b2955d5365bdc0b2877befcb65cc7d4733c8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexMono-SemiBoldItalic.ttf";
      sha256 = "823bb8578c887546cf1a4e3cb58b01dbb9a631d43452302c8ee946ec2bbd2696";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-Bold.ttf?raw=true";
      name = "IBMPlexMono-Bold.ttf";
      sha256 = "0a03b851e92a5abb80081052e4502f8666b22432aad770f2cf9cc762b27bc2e6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/465b90c97b4de569e0b546bb2536900194cf7187/ofl/ibmplexmono/IBMPlexMono-BoldItalic.ttf?raw=true";
      name = "IBMPlexMono-BoldItalic.ttf";
      sha256 = "9fc0b90f967e15b0e4fc970c59b8d4292c1f76efb2f13404dc21b1cb3e2361aa";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexMono-Thin.ttf $out/share/fonts/truetype/IBMPlexMono-Thin.ttf
     install -Dm644 IBMPlexMono-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexMono-ThinItalic.ttf
     install -Dm644 IBMPlexMono-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexMono-ExtraLight.ttf
     install -Dm644 IBMPlexMono-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexMono-ExtraLightItalic.ttf
     install -Dm644 IBMPlexMono-Light.ttf $out/share/fonts/truetype/IBMPlexMono-Light.ttf
     install -Dm644 IBMPlexMono-LightItalic.ttf $out/share/fonts/truetype/IBMPlexMono-LightItalic.ttf
     install -Dm644 IBMPlexMono-Regular.ttf $out/share/fonts/truetype/IBMPlexMono-Regular.ttf
     install -Dm644 IBMPlexMono-Italic.ttf $out/share/fonts/truetype/IBMPlexMono-Italic.ttf
     install -Dm644 IBMPlexMono-Medium.ttf $out/share/fonts/truetype/IBMPlexMono-Medium.ttf
     install -Dm644 IBMPlexMono-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexMono-MediumItalic.ttf
     install -Dm644 IBMPlexMono-SemiBold.ttf $out/share/fonts/truetype/IBMPlexMono-SemiBold.ttf
     install -Dm644 IBMPlexMono-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexMono-SemiBoldItalic.ttf
     install -Dm644 IBMPlexMono-Bold.ttf $out/share/fonts/truetype/IBMPlexMono-Bold.ttf
     install -Dm644 IBMPlexMono-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexMono-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Mono";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
