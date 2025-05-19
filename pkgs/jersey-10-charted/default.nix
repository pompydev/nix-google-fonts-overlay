{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-10-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jersey10charted/Jersey10Charted-Regular.ttf?raw=true";
      name = "Jersey10Charted-Regular.ttf";
      sha256 = "c1c211d6bc9569ccc4ae77f3422cfb7f9266aa32cf86351509495d56d94d4a04";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey10Charted-Regular.ttf $out/share/fonts/truetype/Jersey10Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 10 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
