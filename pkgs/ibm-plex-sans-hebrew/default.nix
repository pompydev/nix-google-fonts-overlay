{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-hebrew-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-Thin.ttf?raw=true";
      name = "IBMPlexSansHebrew-Thin.ttf";
      sha256 = "cb05cd9206a980572a86d585e3a4378d19c2213bec95b28b8f00852422aaffac";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansHebrew-ExtraLight.ttf";
      sha256 = "2b8d281f63cc7b7deafe7b8370529f321861338516becd2b823f6532d8f4d275";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-Light.ttf?raw=true";
      name = "IBMPlexSansHebrew-Light.ttf";
      sha256 = "0d7f6392a7f3e1422aacf56e435b030f9691b4c87f4dabe73cf261e77ffef7bc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-Regular.ttf?raw=true";
      name = "IBMPlexSansHebrew-Regular.ttf";
      sha256 = "c11df42adf5e2c6e77e623dbedbe8cc23ba72196ac9ad8beb02754eebd9c400a";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-Medium.ttf?raw=true";
      name = "IBMPlexSansHebrew-Medium.ttf";
      sha256 = "15b5d6b20f5b4007f2d709ff786266ff62ba9b13ba4e5ac4d23f37d554d68534";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-SemiBold.ttf?raw=true";
      name = "IBMPlexSansHebrew-SemiBold.ttf";
      sha256 = "3ca3829acbeb58f0832f3320a54bab233904c07d0d1dc79b7f1ff3f36ba68b2d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ibmplexsanshebrew/IBMPlexSansHebrew-Bold.ttf?raw=true";
      name = "IBMPlexSansHebrew-Bold.ttf";
      sha256 = "4468a526f606ac74e8db9125b785a932cf55a265f8e358855371bed6126a1637";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansHebrew-Thin.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-Thin.ttf
     install -Dm644 IBMPlexSansHebrew-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-ExtraLight.ttf
     install -Dm644 IBMPlexSansHebrew-Light.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-Light.ttf
     install -Dm644 IBMPlexSansHebrew-Regular.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-Regular.ttf
     install -Dm644 IBMPlexSansHebrew-Medium.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-Medium.ttf
     install -Dm644 IBMPlexSansHebrew-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-SemiBold.ttf
     install -Dm644 IBMPlexSansHebrew-Bold.ttf $out/share/fonts/truetype/IBMPlexSansHebrew-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Hebrew";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
