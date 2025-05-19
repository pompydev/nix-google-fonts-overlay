{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wendy-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/wendyone/WendyOne-Regular.ttf?raw=true";
      name = "WendyOne-Regular.ttf";
      sha256 = "2e2da0e8bb0a593656d38fc8e265c5b09b2c45b294bd23f39f135c2e36c89daf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WendyOne-Regular.ttf $out/share/fonts/truetype/WendyOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Wendy One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
