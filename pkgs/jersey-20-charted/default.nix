{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-20-charted-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/jersey20charted/Jersey20Charted-Regular.ttf?raw=true";
      name = "Jersey20Charted-Regular.ttf";
      sha256 = "4e76e87dcb7b42858089347e59950b965c10ae690fa4172c16fe12d7c606bbea";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey20Charted-Regular.ttf $out/share/fonts/truetype/Jersey20Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 20 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
