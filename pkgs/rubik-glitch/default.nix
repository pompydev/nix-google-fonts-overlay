{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-glitch-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikglitch/RubikGlitch-Regular.ttf?raw=true";
      name = "RubikGlitch-Regular.ttf";
      sha256 = "260245012483d56956269100ebece747aa95b4b67e5a9411a81a36e91f55e653";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikGlitch-Regular.ttf $out/share/fonts/truetype/RubikGlitch-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Glitch";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
