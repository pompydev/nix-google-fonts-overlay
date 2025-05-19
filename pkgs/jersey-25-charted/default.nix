{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "jersey-25-charted-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/jersey25charted/Jersey25Charted-Regular.ttf?raw=true";
      name = "Jersey25Charted-Regular.ttf";
      sha256 = "0faae6b6c5b031e6f5ef191cc43e3a3a25e1ee9e74713e4b93ba3007137937f8";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Jersey25Charted-Regular.ttf $out/share/fonts/truetype/Jersey25Charted-Regular.ttf
  '';

  meta = with lib; {
    description = "Jersey 25 Charted";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
