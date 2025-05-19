{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "ingrid-darling-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/ingriddarling/IngridDarling-Regular.ttf?raw=true";
      name = "IngridDarling-Regular.ttf";
      sha256 = "f08b43438d6dc7742a9c0434e7199e01272a2c1b2b135c9a886f6517c9e5ae4f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 IngridDarling-Regular.ttf $out/share/fonts/truetype/IngridDarling-Regular.ttf
  '';

  meta = with lib; {
    description = "Ingrid Darling";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
