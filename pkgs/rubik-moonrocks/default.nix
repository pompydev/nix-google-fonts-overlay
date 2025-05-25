{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rubik-moonrocks-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/rubikmoonrocks/RubikMoonrocks-Regular.ttf?raw=true";
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
