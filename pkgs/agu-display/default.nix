{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "agu-display-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/agudisplay/AguDisplay%5BMORF%5D.ttf?raw=true";
      name = "AguDisplay_MORF_.ttf";
      sha256 = "27ed259a81a476a354abc4cf5b31717241a57db1e6bce24453729214930c96ee";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AguDisplay_MORF_.ttf $out/share/fonts/truetype/AguDisplay_MORF_.ttf
  '';

  meta = with lib; {
    description = "Agu Display";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
