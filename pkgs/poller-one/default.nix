{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poller-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/pollerone/PollerOne.ttf?raw=true";
      name = "PollerOne.ttf";
      sha256 = "49c5128cb550156e9384453906b869b830aafacfc3a9332ccf989c8ed146d773";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 PollerOne.ttf $out/share/fonts/truetype/PollerOne.ttf
  '';

  meta = with lib; {
    description = "Poller One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
