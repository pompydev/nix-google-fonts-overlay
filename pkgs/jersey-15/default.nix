{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-15-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jersey15/Jersey15-Regular.ttf?raw=true";
      name = "Jersey15-Regular.ttf";
      sha256 = "dbe00479d62bb3b9fcf0d28f88a021ffc4bd7b01d6ad5c6f74b5fa371bb210ed";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey15-Regular.ttf $out/share/fonts/truetype/Jersey15-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 15";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
