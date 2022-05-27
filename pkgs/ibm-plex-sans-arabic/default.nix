{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-arabic-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-Thin.ttf?raw=true";
      name = "IBMPlexSansArabic-Thin.ttf";
      sha256 = "7a5da5da11ec926c7e6423e1c6dd8dcfd2ae61696a16842ab8dc834c1c263691";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansArabic-ExtraLight.ttf";
      sha256 = "d7f47d691146eab54b1b1032351745beba6359f7b44ea2bd596645e779c62f5b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-Light.ttf?raw=true";
      name = "IBMPlexSansArabic-Light.ttf";
      sha256 = "b07f39db4ddec1e51706ef93337dd7ef617cc689c3692e9777ddf2b770587d71";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-Regular.ttf?raw=true";
      name = "IBMPlexSansArabic-Regular.ttf";
      sha256 = "81601f9ec7cb3539b7e06d450d309e946161c9b924b5ecae2b0b310f0757417c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-Medium.ttf?raw=true";
      name = "IBMPlexSansArabic-Medium.ttf";
      sha256 = "1cb43b7ac12ec53edd14035fb59dfa423ef39e320e1d0afdb6f89bd69b43ef87";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-SemiBold.ttf?raw=true";
      name = "IBMPlexSansArabic-SemiBold.ttf";
      sha256 = "230b3d957e6ccd7bbaf20ebb72dbfdd8204fcda0f9138c0fceda35e28a208bd1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/121e596e0923a3fb124f45a8b858769a199369d3/ofl/ibmplexsansarabic/IBMPlexSansArabic-Bold.ttf?raw=true";
      name = "IBMPlexSansArabic-Bold.ttf";
      sha256 = "dd1b338be0610aeba68e860dba82120efb6ce3f629353f28e3acea7dfaa5c8eb";
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
