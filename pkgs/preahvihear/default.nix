{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "preahvihear-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/preahvihear/Preahvihear-Regular.ttf?raw=true";
      name = "Preahvihear-Regular.ttf";
      sha256 = "ea306be8e286bc3bd75b9cb497caa38bdcd06e8d6541a53e2e1a77f16d7ed522";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Preahvihear-Regular.ttf $out/share/fonts/truetype/Preahvihear-Regular.ttf
  '';

  meta = with lib; {
    description = "Preahvihear";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
