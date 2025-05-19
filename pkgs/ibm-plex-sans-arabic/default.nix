{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-arabic-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-Thin.ttf?raw=true";
      name = "IBMPlexSansArabic-Thin.ttf";
      sha256 = "f8e1f556f815e3d29c531f79ff2bed276bec18d403fc6470b54900922cd91a79";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansArabic-ExtraLight.ttf";
      sha256 = "4d4137f37a1acd61f1b7eba47c08d0996789596b1e535f9220914ad5daf0a198";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-Light.ttf?raw=true";
      name = "IBMPlexSansArabic-Light.ttf";
      sha256 = "0af9d1effbb36ff74d13c64f752c771ecb9162a451cf151c5425f4d00d4daa7c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-Regular.ttf?raw=true";
      name = "IBMPlexSansArabic-Regular.ttf";
      sha256 = "6f611412270a132bbac838da9259d4c68569b4175f3b3b8fa3fa36a30b56dab9";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-Medium.ttf?raw=true";
      name = "IBMPlexSansArabic-Medium.ttf";
      sha256 = "b8363ab9f733dfa4f8e96b8b2102c24b5cf4110fb96d1d3d9a9412f6fb49cf74";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-SemiBold.ttf?raw=true";
      name = "IBMPlexSansArabic-SemiBold.ttf";
      sha256 = "597bd5502e5997be4414e4c9c88834b30ff3784250c84f20bce2b20e53ebd467";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsansarabic/IBMPlexSansArabic-Bold.ttf?raw=true";
      name = "IBMPlexSansArabic-Bold.ttf";
      sha256 = "691e0c891a38637ae6bbdb69700f8042cb0724a137bee615068ffdb92244f61f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansArabic-Thin.ttf $out/share/fonts/truetype/IBMPlexSansArabic-Thin.ttf
     install -Dm644 IBMPlexSansArabic-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansArabic-ExtraLight.ttf
     install -Dm644 IBMPlexSansArabic-Light.ttf $out/share/fonts/truetype/IBMPlexSansArabic-Light.ttf
     install -Dm644 IBMPlexSansArabic-Regular.ttf $out/share/fonts/truetype/IBMPlexSansArabic-Regular.ttf
     install -Dm644 IBMPlexSansArabic-Medium.ttf $out/share/fonts/truetype/IBMPlexSansArabic-Medium.ttf
     install -Dm644 IBMPlexSansArabic-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansArabic-SemiBold.ttf
     install -Dm644 IBMPlexSansArabic-Bold.ttf $out/share/fonts/truetype/IBMPlexSansArabic-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Arabic";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
