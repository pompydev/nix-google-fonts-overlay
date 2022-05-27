{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arvo-${version}";
  version = "2022-05-23-195233";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d2cc27513dcbc95a9171abf3e63376869fc294d6/ofl/arvo/Arvo-Regular.ttf?raw=true";
      name = "Arvo-Regular.ttf";
      sha256 = "f41bd41471ec2db7140351bdde614da5341524503598ff7fe79f3c89c13b605e";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d2cc27513dcbc95a9171abf3e63376869fc294d6/ofl/arvo/Arvo-Italic.ttf?raw=true";
      name = "Arvo-Italic.ttf";
      sha256 = "a2eb63a0771b8d13d8e54bf650a02aef813eeaa2e10f6298358e6b15d26c6686";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d2cc27513dcbc95a9171abf3e63376869fc294d6/ofl/arvo/Arvo-Bold.ttf?raw=true";
      name = "Arvo-Bold.ttf";
      sha256 = "6239b2edee762db0ab99343137c9ba15ae81fc843da2e76a0a395781748cc21f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/d2cc27513dcbc95a9171abf3e63376869fc294d6/ofl/arvo/Arvo-BoldItalic.ttf?raw=true";
      name = "Arvo-BoldItalic.ttf";
      sha256 = "fc29e57f5558873e41ca9ff9a9c77521565f12c6972756d0fbcc592e1f0f4edb";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arvo-Regular.ttf $out/share/fonts/truetype/Arvo-Regular.ttf
     install -Dm644 Arvo-Italic.ttf $out/share/fonts/truetype/Arvo-Italic.ttf
     install -Dm644 Arvo-Bold.ttf $out/share/fonts/truetype/Arvo-Bold.ttf
     install -Dm644 Arvo-BoldItalic.ttf $out/share/fonts/truetype/Arvo-BoldItalic.ttf
  '';

  meta = with lib; {
    description = "Arvo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
