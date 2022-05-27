{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "darker-grotesque-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-Light.ttf?raw=true";
      name = "DarkerGrotesque-Light.ttf";
      sha256 = "3245175a0f153e8f74fa337c2a56f12276b2768430e0cbffbe38bcf220ed9026";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-Regular.ttf?raw=true";
      name = "DarkerGrotesque-Regular.ttf";
      sha256 = "045af362cfcd467866885d89114335268cd654f1ed33d4672bb3e89174b32c74";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-Medium.ttf?raw=true";
      name = "DarkerGrotesque-Medium.ttf";
      sha256 = "d990221d8321f09e9d8ec2767651e6ed465d672d5e01bf109e6bd1625f73c2fc";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-SemiBold.ttf?raw=true";
      name = "DarkerGrotesque-SemiBold.ttf";
      sha256 = "d9c66a8ddf0fadd4948c6486514ee4a6f85cadc39a978137837b8edcd4b4957c";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-Bold.ttf?raw=true";
      name = "DarkerGrotesque-Bold.ttf";
      sha256 = "498c7bdbeef9ceb19137f13a80f9e87496e413c44a155cc2b88bde1c16d51121";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-ExtraBold.ttf?raw=true";
      name = "DarkerGrotesque-ExtraBold.ttf";
      sha256 = "4b26f167983db270d85c24a536a7582e169f9c9c21ddd0bd5bc41ecb6ae1ba45";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b77c4d9b6a6b3ee7ba2ef09734d0bbabbf5fb48c/ofl/darkergrotesque/DarkerGrotesque-Black.ttf?raw=true";
      name = "DarkerGrotesque-Black.ttf";
      sha256 = "aca8d68c4ebf18e28102a61db5c4f519df2143e30573185c0a3f2b408f35c359";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DarkerGrotesque-Light.ttf $out/share/fonts/truetype/DarkerGrotesque-Light.ttf
     install -Dm644 DarkerGrotesque-Regular.ttf $out/share/fonts/truetype/DarkerGrotesque-Regular.ttf
     install -Dm644 DarkerGrotesque-Medium.ttf $out/share/fonts/truetype/DarkerGrotesque-Medium.ttf
     install -Dm644 DarkerGrotesque-SemiBold.ttf $out/share/fonts/truetype/DarkerGrotesque-SemiBold.ttf
     install -Dm644 DarkerGrotesque-Bold.ttf $out/share/fonts/truetype/DarkerGrotesque-Bold.ttf
     install -Dm644 DarkerGrotesque-ExtraBold.ttf $out/share/fonts/truetype/DarkerGrotesque-ExtraBold.ttf
     install -Dm644 DarkerGrotesque-Black.ttf $out/share/fonts/truetype/DarkerGrotesque-Black.ttf
  '';

  meta = with lib; {
    description = "Darker Grotesque";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
