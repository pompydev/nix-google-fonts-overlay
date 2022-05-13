{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "blaka-hollow-${version}";
  version = "2022-04-27-084210";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/21f51aedbe2704dc941c74711661b9d9c87b3558/ofl/blakahollow/BlakaHollow-Regular.ttf?raw=true";
      name = "BlakaHollow-Regular.ttf";
      sha256 = "52551897a1bfec76303b277f0499c5d8ccf803409e0f5f49759a288174e45345";
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
