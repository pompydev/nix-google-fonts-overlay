{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "walter-turncoat-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/apache/walterturncoat/WalterTurncoat-Regular.ttf?raw=true";
      name = "WalterTurncoat-Regular.ttf";
      sha256 = "ab7e9ca31710733211c5a938d2c851c84c0d21f6af4486f32bc6d374281b2da0";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WalterTurncoat-Regular.ttf $out/share/fonts/truetype/WalterTurncoat-Regular.ttf
  '';

  meta = with lib; {
    description = "Walter Turncoat";
    license = licenses.asl20;
    platforms = platforms.all;
  };
}
