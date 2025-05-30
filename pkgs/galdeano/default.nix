{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "galdeano-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/galdeano/Galdeano-Regular.ttf?raw=true";
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
