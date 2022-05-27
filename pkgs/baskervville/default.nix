{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "baskervville-${version}";
  version = "2022-05-23-211740";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f514d07957d41a490d9d0e55df5a418732eaac1d/ofl/baskervville/Baskervville-Regular.ttf?raw=true";
      name = "Baskervville-Regular.ttf";
      sha256 = "aeea682b360f0ae2d2641d335918c3c6783a7c7a0712d8326aacacc137bf8664";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f514d07957d41a490d9d0e55df5a418732eaac1d/ofl/baskervville/Baskervville-Italic.ttf?raw=true";
      name = "Baskervville-Italic.ttf";
      sha256 = "2e303ca18fe3a5242f2f58edece96aa44b2a8bcb69aed1fc58736c230c8f3545";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Baskervville-Regular.ttf $out/share/fonts/truetype/Baskervville-Regular.ttf
     install -Dm644 Baskervville-Italic.ttf $out/share/fonts/truetype/Baskervville-Italic.ttf
  '';

  meta = with lib; {
    description = "Baskervville";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
