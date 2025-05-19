{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-20-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jersey20charted/Jersey20Charted-Regular.ttf?raw=true";
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
