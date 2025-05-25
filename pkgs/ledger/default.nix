{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ledger-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/ledger/Ledger-Regular.ttf?raw=true";
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
