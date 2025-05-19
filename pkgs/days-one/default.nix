{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "days-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/daysone/DaysOne-Regular.ttf?raw=true";
      name = "DaysOne-Regular.ttf";
      sha256 = "7b5a0e6d88696e43e95f6320613908e53d36ad854b4a18e4a1b8d1c19fdbf1fe";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 DaysOne-Regular.ttf $out/share/fonts/truetype/DaysOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Days One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
