{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gulzar-${version}";
  version = "2022-05-18-145107";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/deb08dfb76a0774e12e8ab1b5b20c57d4098a97c/ofl/gulzar/Gulzar-Regular.ttf?raw=true";
      name = "Gulzar-Regular.ttf";
      sha256 = "246337973ac64e8b70fe611405dcf32a395a8885c4497dc45dbc4975d3ac0831";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Gulzar-Regular.ttf $out/share/fonts/truetype/Gulzar-Regular.ttf
  '';

  meta = with lib; {
    description = "Gulzar";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
