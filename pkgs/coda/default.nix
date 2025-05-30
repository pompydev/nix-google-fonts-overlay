{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "coda-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/coda/Coda-Regular.ttf?raw=true";
      name = "Coda-Regular.ttf";
      sha256 = "f5d32ae9d5c78cdab7e75a52bd1da07ae22644597232d085a5ce7cd1af341e17";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/coda/Coda-ExtraBold.ttf?raw=true";
      name = "Coda-ExtraBold.ttf";
      sha256 = "35909e4c6907e1391d09baa934c5e7a4abb232dedea58e47acaa4aecd165c65c";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Coda-Regular.ttf $out/share/fonts/truetype/Coda-Regular.ttf
     install -Dm644 Coda-ExtraBold.ttf $out/share/fonts/truetype/Coda-ExtraBold.ttf
  '';

  meta = with lib; {
    description = "Coda";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
