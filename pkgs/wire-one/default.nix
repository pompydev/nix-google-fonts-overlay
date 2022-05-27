{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wire-one-${version}";
  version = "2022-05-23-231859";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/3f57c8fab77c7854f09cdb020398b5bfd182a7de/ofl/wireone/WireOne-Regular.ttf?raw=true";
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
