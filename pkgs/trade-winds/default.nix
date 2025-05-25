{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trade-winds-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/tradewinds/TradeWinds-Regular.ttf?raw=true";
      name = "TradeWinds-Regular.ttf";
      sha256 = "bbc4c9a17927d6c5076a1957b0b165fae6c835c1bfa0fb8c07053243097e495b";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 TradeWinds-Regular.ttf $out/share/fonts/truetype/TradeWinds-Regular.ttf
  '';

  meta = with lib; {
    description = "Trade Winds";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
