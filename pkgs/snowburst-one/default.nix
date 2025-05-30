{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "snowburst-one-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/snowburstone/SnowburstOne-Regular.ttf?raw=true";
      name = "SnowburstOne-Regular.ttf";
      sha256 = "ede8110b5922b718c9b80717a4c5dcc2b4a862767d8319877983773c900bb00f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SnowburstOne-Regular.ttf $out/share/fonts/truetype/SnowburstOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Snowburst One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
