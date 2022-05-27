{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-devanagari-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-Thin.ttf?raw=true";
      name = "IBMPlexSansDevanagari-Thin.ttf";
      sha256 = "f41144a3bf9130ba62ad10d7e0b0f42695bf74f73b00c6154b03f8e35a9196d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansDevanagari-ExtraLight.ttf";
      sha256 = "9fd21512c2dcbd1675f0999195ac6d09011a13f61fe60775ae6a5e00e577c1e5";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-Light.ttf?raw=true";
      name = "IBMPlexSansDevanagari-Light.ttf";
      sha256 = "d174a4b8c9d3de5bdbbdfca5adc87edf578b61fc207f576aec47f440b8c0b256";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-Regular.ttf?raw=true";
      name = "IBMPlexSansDevanagari-Regular.ttf";
      sha256 = "9a309796ffbe3b6827591eb4e6e7f13e273c38d37b40d12a5ac695172571e88b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-Medium.ttf?raw=true";
      name = "IBMPlexSansDevanagari-Medium.ttf";
      sha256 = "a112f36f92ecb6967ee82c643547986462d1ddcff22c20ad024cb0915ddd2bee";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-SemiBold.ttf?raw=true";
      name = "IBMPlexSansDevanagari-SemiBold.ttf";
      sha256 = "57f002a2e09846841ebfc59f12d3f3c530d05ff85648d6856dfe44f531c6c84d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/a3dd250ef48efe60f609ea3558641b389370bd80/ofl/ibmplexsansdevanagari/IBMPlexSansDevanagari-Bold.ttf?raw=true";
      name = "IBMPlexSansDevanagari-Bold.ttf";
      sha256 = "8c1a55530a59f4d3df71e36ed7090e78511cf1e03c32b932c693ae6ac603b38f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansDevanagari-Thin.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-Thin.ttf
     install -Dm644 IBMPlexSansDevanagari-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-ExtraLight.ttf
     install -Dm644 IBMPlexSansDevanagari-Light.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-Light.ttf
     install -Dm644 IBMPlexSansDevanagari-Regular.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-Regular.ttf
     install -Dm644 IBMPlexSansDevanagari-Medium.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-Medium.ttf
     install -Dm644 IBMPlexSansDevanagari-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-SemiBold.ttf
     install -Dm644 IBMPlexSansDevanagari-Bold.ttf $out/share/fonts/truetype/IBMPlexSansDevanagari-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Devanagari";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
