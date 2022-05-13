{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ibm-plex-sans-thai-looped-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-Thin.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-Thin.ttf";
      sha256 = "3ad5c3c2a6b9107a8105250c450e1b2bbaa539a40da58e305c4b61b853e30126";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-ExtraLight.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-ExtraLight.ttf";
      sha256 = "1d8ae33823d3e797b32f5d884ff04879b8d1e266da24e4e9465a50bb209d7a96";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-Light.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-Light.ttf";
      sha256 = "9827df92fc68774d9e51203b11bb831351bfe7bb11509788aeec8dc85ef78365";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-Regular.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-Regular.ttf";
      sha256 = "6d7910d13a7a9e33872d5501fd81a71f84ee532f729bfb72c6ffa94d1f13009e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-Medium.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-Medium.ttf";
      sha256 = "0219cd6e21c9bb226378fa60ebd73e2550b1adb245fec821c817e2b1efcb1f04";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-SemiBold.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-SemiBold.ttf";
      sha256 = "90535e0096a25940788473d2f51ca2dbe4a2404b9fad570b92dc80b792ab22d1";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0457aa161dbfff74fbbf8bd8d1c54a408ae8fb6b/ofl/ibmplexsansthailooped/IBMPlexSansThaiLooped-Bold.ttf?raw=true";
      name = "IBMPlexSansThaiLooped-Bold.ttf";
      sha256 = "df53c5c794b910f68bb8f3075a6c9bf59261c3ad964bd2be0ddff1bd4c79c7a9";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IBMPlexSansThaiLooped-Thin.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-Thin.ttf
     install -Dm644 IBMPlexSansThaiLooped-ExtraLight.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-ExtraLight.ttf
     install -Dm644 IBMPlexSansThaiLooped-Light.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-Light.ttf
     install -Dm644 IBMPlexSansThaiLooped-Regular.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-Regular.ttf
     install -Dm644 IBMPlexSansThaiLooped-Medium.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-Medium.ttf
     install -Dm644 IBMPlexSansThaiLooped-SemiBold.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-SemiBold.ttf
     install -Dm644 IBMPlexSansThaiLooped-Bold.ttf $out/share/fonts/truetype/IBMPlexSansThaiLooped-Bold.ttf
  '';

  meta = with lib; {
    description = "IBM Plex Sans Thai Looped";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
