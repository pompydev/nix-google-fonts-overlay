{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fuggles-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/b5ca2d5f29eb0783b85dadf973abeb350271b071/ofl/fuggles/Fuggles-Regular.ttf?raw=true";
      name = "Fuggles-Regular.ttf";
      sha256 = "2e738fa143601d4415c858d8c844f12333b49c47ba5c12c787a0f6fa150e152a";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Fuggles-Regular.ttf $out/share/fonts/truetype/Fuggles-Regular.ttf
  '';

  meta = with lib; {
    description = "Fuggles";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
