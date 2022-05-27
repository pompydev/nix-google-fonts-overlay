{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "arima-${version}";
  version = "2022-05-25-172025";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/906f7a26b9e8f028435cbd8d943f3218491cd4f2/ofl/arima/Arima%5Bwght%5D.ttf?raw=true";
      name = "Arima_wght_.ttf";
      sha256 = "a1b01d2b80c278c429b0f09969da0482a2414426014a035746ec581b42a76a79";
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
