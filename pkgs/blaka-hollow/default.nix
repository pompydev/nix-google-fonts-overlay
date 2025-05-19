{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-hollow-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/blakahollow/BlakaHollow-Regular.ttf?raw=true";
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
