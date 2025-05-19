{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "galdeano-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/galdeano/Galdeano-Regular.ttf?raw=true";
      name = "Galdeano-Regular.ttf";
      sha256 = "ec2379e6ae1192420eb7a633c170890cf85944abc73e6ef6c68371d1c05c6652";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Galdeano-Regular.ttf $out/share/fonts/truetype/Galdeano-Regular.ttf
  '';

  meta = with lib; {
    description = "Galdeano";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
