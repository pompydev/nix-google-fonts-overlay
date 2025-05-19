{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wire-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wireone/WireOne-Regular.ttf?raw=true";
      name = "WireOne-Regular.ttf";
      sha256 = "d505059c3c094b921358db3e41be899789edf4c4aec1ec777be1643efcd9fc05";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WireOne-Regular.ttf $out/share/fonts/truetype/WireOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Wire One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
