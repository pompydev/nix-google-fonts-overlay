{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-burned-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/rubikburned/RubikBurned-Regular.ttf?raw=true";
      name = "RubikBurned-Regular.ttf";
      sha256 = "149705177b7fe352b54227b05121c030520a55e1cc8a4cdd7f8d0af324e6f00d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikBurned-Regular.ttf $out/share/fonts/truetype/RubikBurned-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Burned";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
