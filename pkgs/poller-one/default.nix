{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "poller-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/pollerone/PollerOne.ttf?raw=true";
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
