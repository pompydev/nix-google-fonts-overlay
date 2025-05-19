{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "chelsea-market-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/chelseamarket/ChelseaMarket-Regular.ttf?raw=true";
      name = "ChelseaMarket-Regular.ttf";
      sha256 = "7243be29a2d74e6a826e1091f74c89e58cc8010047c6db8de13f616e81b1f5f2";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 ChelseaMarket-Regular.ttf $out/share/fonts/truetype/ChelseaMarket-Regular.ttf
  '';

  meta = with lib; {
    description = "Chelsea Market";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
