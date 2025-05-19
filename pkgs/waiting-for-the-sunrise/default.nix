{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "waiting-for-the-sunrise-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/waitingforthesunrise/WaitingfortheSunrise.ttf?raw=true";
      name = "WaitingfortheSunrise.ttf";
      sha256 = "ac74e70390f5b1be6927c1e079bd6143821a362550b264c5eb7edde34f0899f4";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 WaitingfortheSunrise.ttf $out/share/fonts/truetype/WaitingfortheSunrise.ttf
  '';

  meta = with lib; {
    description = "Waiting for the Sunrise";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
