{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "liter-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/liter/Liter-Regular.ttf?raw=true";
      name = "Liter-Regular.ttf";
      sha256 = "379fe197584f098a0318278c5e1b453a1ef8f017925041e3e51e18efb025822d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Liter-Regular.ttf $out/share/fonts/truetype/Liter-Regular.ttf
  '';

  meta = with lib; {
    description = "Liter";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
