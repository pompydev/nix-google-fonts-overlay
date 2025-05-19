{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "spectral-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-ExtraLight.ttf?raw=true";
      name = "Spectral-ExtraLight.ttf";
      sha256 = "5d852db897fd7ad5ce640a6e88f1cd70eac75777c541d02d86749af8d4797ff1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-ExtraLightItalic.ttf?raw=true";
      name = "Spectral-ExtraLightItalic.ttf";
      sha256 = "492e823b5d8d67d2f18fe06938d84e8decee24b1790d4c6ebdade3cbd1b83b44";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-Light.ttf?raw=true";
      name = "Spectral-Light.ttf";
      sha256 = "a2a530303d326473b69ab7863b879e9203ec747e51d5fa7c7b19e0e975e00740";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-LightItalic.ttf?raw=true";
      name = "Spectral-LightItalic.ttf";
      sha256 = "4cb424aeb1d6b822e9ce6213789afeabd403c6765fc7339e184c27ae4d6a6b01";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-Regular.ttf?raw=true";
      name = "Spectral-Regular.ttf";
      sha256 = "c89021dc20720c8d0dcf40b0b2f6e00c13665fa8041717f581396f51b8c78f5d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-Italic.ttf?raw=true";
      name = "Spectral-Italic.ttf";
      sha256 = "7ec97244259db4008c4b1224c7914e5371c797c0044af9d85c2d761ba0e5f787";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-Medium.ttf?raw=true";
      name = "Spectral-Medium.ttf";
      sha256 = "f385bc588599c879112272711d4acecc126674009d747a27284f59e93a240e83";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-MediumItalic.ttf?raw=true";
      name = "Spectral-MediumItalic.ttf";
      sha256 = "82388c41e76d6417ce9947418fa2cda1ed99f24d4ff295b2f05572178127663f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-SemiBold.ttf?raw=true";
      name = "Spectral-SemiBold.ttf";
      sha256 = "5f86915a744832ecf6e4a17ab04bea091b9fa992ef5164ff65ae34c1da2fe94b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-SemiBoldItalic.ttf?raw=true";
      name = "Spectral-SemiBoldItalic.ttf";
      sha256 = "46ad3a9f93b98dc2dbdeee265e76eb846c5be912aa8f09f42e3692706c6f563b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-Bold.ttf?raw=true";
      name = "Spectral-Bold.ttf";
      sha256 = "70ddb1ec6ae3b0b8d0c79231f670de786978f19baeba2130757526e407aebf9b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-BoldItalic.ttf?raw=true";
      name = "Spectral-BoldItalic.ttf";
      sha256 = "709fa4f2da9be216fd52125db2d6caa4f90150f48de1a453c9ecf91117ab49b6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-ExtraBold.ttf?raw=true";
      name = "Spectral-ExtraBold.ttf";
      sha256 = "af3f8513db8d047ebecb1682b5e04dfc12ec7e6b51b71654d4d348f12a5e6b5a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/spectral/Spectral-ExtraBoldItalic.ttf?raw=true";
      name = "Spectral-ExtraBoldItalic.ttf";
      sha256 = "680ba360e376759b54f33154a89e3c75842d4cf8faa498a717c3e1a65a93305a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Spectral-ExtraLight.ttf $out/share/fonts/truetype/Spectral-ExtraLight.ttf
     install -Dm644 Spectral-ExtraLightItalic.ttf $out/share/fonts/truetype/Spectral-ExtraLightItalic.ttf
     install -Dm644 Spectral-Light.ttf $out/share/fonts/truetype/Spectral-Light.ttf
     install -Dm644 Spectral-LightItalic.ttf $out/share/fonts/truetype/Spectral-LightItalic.ttf
     install -Dm644 Spectral-Regular.ttf $out/share/fonts/truetype/Spectral-Regular.ttf
     install -Dm644 Spectral-Italic.ttf $out/share/fonts/truetype/Spectral-Italic.ttf
     install -Dm644 Spectral-Medium.ttf $out/share/fonts/truetype/Spectral-Medium.ttf
     install -Dm644 Spectral-MediumItalic.ttf $out/share/fonts/truetype/Spectral-MediumItalic.ttf
     install -Dm644 Spectral-SemiBold.ttf $out/share/fonts/truetype/Spectral-SemiBold.ttf
     install -Dm644 Spectral-SemiBoldItalic.ttf $out/share/fonts/truetype/Spectral-SemiBoldItalic.ttf
     install -Dm644 Spectral-Bold.ttf $out/share/fonts/truetype/Spectral-Bold.ttf
     install -Dm644 Spectral-BoldItalic.ttf $out/share/fonts/truetype/Spectral-BoldItalic.ttf
     install -Dm644 Spectral-ExtraBold.ttf $out/share/fonts/truetype/Spectral-ExtraBold.ttf
     install -Dm644 Spectral-ExtraBoldItalic.ttf $out/share/fonts/truetype/Spectral-ExtraBoldItalic.ttf
  '';

  meta = with lib; {
    description = "Spectral";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
