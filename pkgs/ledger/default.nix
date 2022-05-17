{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ledger-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f8265bddf91e1f2f54160122209d4f60cf2221c9/ofl/ledger/Ledger-Regular.ttf?raw=true";
      name = "Ledger-Regular.ttf";
      sha256 = "0d9e4086208d5aee8813ae1185010c58fa2f07933fb5c1a1d0950f42bd976272";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Ledger-Regular.ttf $out/share/fonts/truetype/Ledger-Regular.ttf
  '';

  meta = with lib; {
    description = "Ledger";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
