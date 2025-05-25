{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-hollow-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/blakahollow/BlakaHollow-Regular.ttf?raw=true";
      name = "BlakaHollow-Regular.ttf";
      sha256 = "59cb30824e6023d454b4b44038cf44cdc9a4ad67f9795171c646c98ceb2bd542";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 BlakaHollow-Regular.ttf $out/share/fonts/truetype/BlakaHollow-Regular.ttf
  '';

  meta = with lib; {
    description = "Blaka Hollow";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
