{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-moonrocks-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/0685b2bb14f0ffb4b4a427f9b31777d5b21d46a9/ofl/rubikmoonrocks/RubikMoonrocks-Regular.ttf?raw=true";
      name = "RubikMoonrocks-Regular.ttf";
      sha256 = "39ff4d96b906e8cc2fd7a350aa13620d5eff18d776fedb5c98c12cbf6e1f2c1e";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 RubikMoonrocks-Regular.ttf $out/share/fonts/truetype/RubikMoonrocks-Regular.ttf
  '';

  meta = with lib; {
    description = "Rubik Moonrocks";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
