{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "karantina-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/karantina/Karantina-Light.ttf?raw=true";
      name = "Karantina-Light.ttf";
      sha256 = "3286ffc39003621874ad2ac2d6ca9374d2728443465c4df6222dff425814560d";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/karantina/Karantina-Regular.ttf?raw=true";
      name = "Karantina-Regular.ttf";
      sha256 = "a1ef8ee51724f0182f07d060b63047540a0bca96db10d33fa6a0b539f99019bf";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/karantina/Karantina-Bold.ttf?raw=true";
      name = "Karantina-Bold.ttf";
      sha256 = "fc099ee72a843fb5b4d574abd099e047eec4cf476a1a2c65fe520e1cdcc897be";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Karantina-Light.ttf $out/share/fonts/truetype/Karantina-Light.ttf
     install -Dm644 Karantina-Regular.ttf $out/share/fonts/truetype/Karantina-Regular.ttf
     install -Dm644 Karantina-Bold.ttf $out/share/fonts/truetype/Karantina-Bold.ttf
  '';

  meta = with lib; {
    description = "Karantina";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
