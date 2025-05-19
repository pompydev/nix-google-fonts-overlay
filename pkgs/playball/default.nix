{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "playball-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/playball/Playball-Regular.ttf?raw=true";
      name = "Playball-Regular.ttf";
      sha256 = "130654dd192f4ccd1c4fa2dc516d03cca93dc8ecdaf30d458283e54dcaef8f40";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Playball-Regular.ttf $out/share/fonts/truetype/Playball-Regular.ttf
  '';

  meta = with lib; {
    description = "Playball";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
