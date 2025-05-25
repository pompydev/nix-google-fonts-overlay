{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "damion-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/damion/Damion-Regular.ttf?raw=true";
      name = "Damion-Regular.ttf";
      sha256 = "a51fd6c3c517feb9924b98139c2e902a7317caee52c22a2ec9682973969562bf";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Damion-Regular.ttf $out/share/fonts/truetype/Damion-Regular.ttf
  '';

  meta = with lib; {
    description = "Damion";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
