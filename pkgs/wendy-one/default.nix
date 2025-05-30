{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "wendy-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/wendyone/WendyOne-Regular.ttf?raw=true";
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
