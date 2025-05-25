{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-15-charted-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jersey15charted/Jersey15Charted-Regular.ttf?raw=true";
      name = "Jersey15Charted-Regular.ttf";
      sha256 = "c15075e7ed3f5930feda9f628c8855cdfba4dd38d4b22198b742f602d08aea35";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey15Charted-Regular.ttf $out/share/fonts/truetype/Jersey15Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 15 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
