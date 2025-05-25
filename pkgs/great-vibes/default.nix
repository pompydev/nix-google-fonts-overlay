{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "great-vibes-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/greatvibes/GreatVibes-Regular.ttf?raw=true";
      name = "GreatVibes-Regular.ttf";
      sha256 = "8d509802186f1b51572531ecf313e8098f9a5bfdfaca93f0c9b34467f9982d15";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GreatVibes-Regular.ttf $out/share/fonts/truetype/GreatVibes-Regular.ttf
  '';

  meta = with lib; {
    description = "Great Vibes";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
