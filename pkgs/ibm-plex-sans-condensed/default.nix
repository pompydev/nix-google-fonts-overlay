{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-condensed-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Thin.ttf?raw=true";
      name = "IBMPlexSansCondensed-Thin.ttf";
      sha256 = "fe67e17fdc8b55731d88d92294030f7cd8086cdbdc37aaaa993b31d147eba0f7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-ThinItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-ThinItalic.ttf";
      sha256 = "8122c78b19fea475ac9aed5e5d0db831f74b820604bd7a389353de7adf20cb97";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansCondensed-ExtraLight.ttf";
      sha256 = "4a6ba94e0cc7590c277d5d91674705dd73bbb68ab9016d1460c0e2b0f9ef3350";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-ExtraLightItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-ExtraLightItalic.ttf";
      sha256 = "ab729485a2265722908101226d28c2e6681ce98ad09612b964a005e6ddabee7d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Light.ttf?raw=true";
      name = "IBMPlexSansCondensed-Light.ttf";
      sha256 = "3836ed1e1f5c870ddf9fd6a0ed7d74a4385a2ca194fa68782c6a10e609379cc8";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-LightItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-LightItalic.ttf";
      sha256 = "4ff9689e3b8b3c2532e6ce6dfdba0bb5beb3d073c3b7b775a079b03cc2e561f3";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Regular.ttf?raw=true";
      name = "IBMPlexSansCondensed-Regular.ttf";
      sha256 = "e7437c072eef2ef592ae6f2beb0000446287385907abb57ac1cf07bcbaa2aa33";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Italic.ttf?raw=true";
      name = "IBMPlexSansCondensed-Italic.ttf";
      sha256 = "a0320e60c17926c4e210dfdb3b1a346991f35f83b471daf55537ee79cbcb7c7f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Medium.ttf?raw=true";
      name = "IBMPlexSansCondensed-Medium.ttf";
      sha256 = "426350c298277f7f9d1a93956572799ca3d16e2d43e7f60eec8382bcd795ec30";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-MediumItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-MediumItalic.ttf";
      sha256 = "ab8931c7274aff5b0315b798ac68149f92a667d9647cb9d6263f5f44403e5452";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-SemiBold.ttf?raw=true";
      name = "IBMPlexSansCondensed-SemiBold.ttf";
      sha256 = "a081ca60548aea14100757a2d6fe71ca60fd90ebce779c9a8ae5a0c8fb4526d4";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-SemiBoldItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-SemiBoldItalic.ttf";
      sha256 = "d98d8fb38a3cd725632900188b146c0ba72eabd515a03788bd895bbf365086ae";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-Bold.ttf?raw=true";
      name = "IBMPlexSansCondensed-Bold.ttf";
      sha256 = "b65492d86cdd5cd9d43d2671b55d5d36fec36859fc8b08bc6aba78e441d6c849";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanscondensed/IBMPlexSansCondensed-BoldItalic.ttf?raw=true";
      name = "IBMPlexSansCondensed-BoldItalic.ttf";
      sha256 = "fe1983c07a086fbee939e5f0f826e5428f7d02666c8e3bbb7295fb3504597a07";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansCondensed-Thin.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Thin.ttf
     install -Dm644 IBMPlexSansCondensed-ThinItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-ThinItalic.ttf
     install -Dm644 IBMPlexSansCondensed-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-ExtraLight.ttf
     install -Dm644 IBMPlexSansCondensed-ExtraLightItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-ExtraLightItalic.ttf
     install -Dm644 IBMPlexSansCondensed-Light.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Light.ttf
     install -Dm644 IBMPlexSansCondensed-LightItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-LightItalic.ttf
     install -Dm644 IBMPlexSansCondensed-Regular.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Regular.ttf
     install -Dm644 IBMPlexSansCondensed-Italic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Italic.ttf
     install -Dm644 IBMPlexSansCondensed-Medium.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Medium.ttf
     install -Dm644 IBMPlexSansCondensed-MediumItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-MediumItalic.ttf
     install -Dm644 IBMPlexSansCondensed-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-SemiBold.ttf
     install -Dm644 IBMPlexSansCondensed-SemiBoldItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-SemiBoldItalic.ttf
     install -Dm644 IBMPlexSansCondensed-Bold.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-Bold.ttf
     install -Dm644 IBMPlexSansCondensed-BoldItalic.ttf $out/share/fonts/truetype/IBMPlexSansCondensed-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Condensed";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
