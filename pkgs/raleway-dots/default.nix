{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "raleway-dots-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ralewaydots/RalewayDots-Regular.ttf?raw=true";
      name = "RalewayDots-Regular.ttf";
      sha256 = "a35582c11e29d5d40bf5ed263f4be18c42264376b51b6b8a7a1b79252b853e09";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RalewayDots-Regular.ttf $out/share/fonts/truetype/RalewayDots-Regular.ttf
  '';

  meta = with lib; {
    description = "Raleway Dots";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
