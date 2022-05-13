{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-kr-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-Thin.ttf?raw=true";
      name = "IBMPlexSansKR-Thin.ttf";
      sha256 = "80fe4c5dc2fce17a7115a84966da6f5e443e21f332db2e1de53339f7f92357c6";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansKR-ExtraLight.ttf";
      sha256 = "202d1aa692a8d222026f981725477df7ea963246c3c6080cc3b55669414fc861";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-Light.ttf?raw=true";
      name = "IBMPlexSansKR-Light.ttf";
      sha256 = "a44ebb467261e0bb02f5d5ce375ca5d675a70f8047fd8d4e8dc56add4be50c7b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-Regular.ttf?raw=true";
      name = "IBMPlexSansKR-Regular.ttf";
      sha256 = "53750379270312368cf7641901f43a98dd892e3d9d5798cf25cdc245c85c71c0";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-Medium.ttf?raw=true";
      name = "IBMPlexSansKR-Medium.ttf";
      sha256 = "4a7130f56ce50bf10f9d383f624e50bad2c80bebc63e51f4269ece2c7d919166";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-SemiBold.ttf?raw=true";
      name = "IBMPlexSansKR-SemiBold.ttf";
      sha256 = "823c1956adf56c27c06b062725dfce23f266e4fd1366290f2957c8407482a817";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/29731dada3b0ad91a10336c8ef5f25dc690aecc4/ofl/ibmplexsanskr/IBMPlexSansKR-Bold.ttf?raw=true";
      name = "IBMPlexSansKR-Bold.ttf";
      sha256 = "9d82a8be5330f6d7b53121262867b402baca672eb69b852928f06d185d357f7d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansKR-Thin.ttf $out/share/fonts/truetype/IBMPlexSansKR-Thin.ttf
     install -Dm644 IBMPlexSansKR-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansKR-ExtraLight.ttf
     install -Dm644 IBMPlexSansKR-Light.ttf $out/share/fonts/truetype/IBMPlexSansKR-Light.ttf
     install -Dm644 IBMPlexSansKR-Regular.ttf $out/share/fonts/truetype/IBMPlexSansKR-Regular.ttf
     install -Dm644 IBMPlexSansKR-Medium.ttf $out/share/fonts/truetype/IBMPlexSansKR-Medium.ttf
     install -Dm644 IBMPlexSansKR-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansKR-SemiBold.ttf
     install -Dm644 IBMPlexSansKR-Bold.ttf $out/share/fonts/truetype/IBMPlexSansKR-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans KR";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
