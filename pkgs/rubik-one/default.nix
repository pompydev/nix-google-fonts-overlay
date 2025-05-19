{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-one-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikone/RubikOne-Regular.ttf?raw=true";
      name = "RubikOne-Regular.ttf";
      sha256 = "fced18ce7220d7504aba15adebd58f63d29eca554180aa74ea7545c9e07e6548";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikOne-Regular.ttf $out/share/fonts/truetype/RubikOne-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik One";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
