{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "khula-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/khula/Khula-Light.ttf?raw=true";
      name = "Khula-Light.ttf";
      sha256 = "805bec764710d2e18590c3b783d0ba241e76368a718107ede318f84b940e5075";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/khula/Khula-Regular.ttf?raw=true";
      name = "Khula-Regular.ttf";
      sha256 = "825477d3c995997ebd41245fc4177bf1681bfd6546674e0d67a29a094c78644f";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/khula/Khula-SemiBold.ttf?raw=true";
      name = "Khula-SemiBold.ttf";
      sha256 = "b12c4895da1a0e7eccc18c844baa1054fd51eab70d3a65786e7c8437fea51986";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/khula/Khula-Bold.ttf?raw=true";
      name = "Khula-Bold.ttf";
      sha256 = "923cafe77cf48066e151f91358800bd9e036b1c417b9fcc326da39d281b87fe7";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fab83f4bec30374b922992db6ee7d3618fd60f17/ofl/khula/Khula-ExtraBold.ttf?raw=true";
      name = "Khula-ExtraBold.ttf";
      sha256 = "ba71d616a428488071037fba6fa660396f0a189fc545cf60b7a0de709075947f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Khula-Light.ttf $out/share/fonts/truetype/Khula-Light.ttf
     install -Dm644 Khula-Regular.ttf $out/share/fonts/truetype/Khula-Regular.ttf
     install -Dm644 Khula-SemiBold.ttf $out/share/fonts/truetype/Khula-SemiBold.ttf
     install -Dm644 Khula-Bold.ttf $out/share/fonts/truetype/Khula-Bold.ttf
     install -Dm644 Khula-ExtraBold.ttf $out/share/fonts/truetype/Khula-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Khula";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
