{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "freehand-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/4f5dbdb58c9075640112a760b0f2376ab04cd187/ofl/freehand/Freehand-Regular.ttf?raw=true";
      name = "Freehand-Regular.ttf";
      sha256 = "3f2f1155d862304cf29cc4252aa5df4d47468d127c3c12cbf16894b0dda6c833";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Freehand-Regular.ttf $out/share/fonts/truetype/Freehand-Regular.ttf
  '';

  meta = with lib; {
    description = "Freehand";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
