{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "damion-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/damion/Damion-Regular.ttf?raw=true";
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
