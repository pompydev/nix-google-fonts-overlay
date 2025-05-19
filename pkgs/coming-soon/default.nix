{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coming-soon-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/comingsoon/ComingSoon-Regular.ttf?raw=true";
      name = "ComingSoon-Regular.ttf";
      sha256 = "cf81388f587ff6122de1a705d1070b8f00abccdba66108509908b5d10715068c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ComingSoon-Regular.ttf $out/share/fonts/truetype/ComingSoon-Regular.ttf
  '';

  meta = with lib; {
    description = "Coming Soon";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
