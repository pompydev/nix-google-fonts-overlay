{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-glitch-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bd0eacd9cd78251eee7aeff1080ae3e92a6a1437/ofl/rubikglitch/RubikGlitch-Regular.ttf?raw=true";
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
