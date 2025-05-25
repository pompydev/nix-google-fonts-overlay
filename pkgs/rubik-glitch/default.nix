{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-glitch-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikglitch/RubikGlitch-Regular.ttf?raw=true";
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
