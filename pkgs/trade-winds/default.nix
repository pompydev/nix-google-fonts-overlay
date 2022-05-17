{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "trade-winds-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/97f586e42631dedfe43896b31b794441bc1dab22/ofl/tradewinds/TradeWinds-Regular.ttf?raw=true";
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
