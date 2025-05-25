{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arima-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/arima/Arima%5Bwght%5D.ttf?raw=true";
      name = "Arima_wght_.ttf";
      sha256 = "c6b0db0d4343e9d08b8e79f9c6f868576c94bc0c839d349535f030b011884e45";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Arima_wght_.ttf $out/share/fonts/truetype/Arima_wght_.ttf
  '';

  meta = with lib; {
    description = "Arima";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
