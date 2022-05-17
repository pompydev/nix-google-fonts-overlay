{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "fleur-de-leah-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/90b4ee651f4e634ed699e3658fc69ea1d3127cac/ofl/fleurdeleah/FleurDeLeah-Regular.ttf?raw=true";
      name = "FleurDeLeah-Regular.ttf";
      sha256 = "11f6c19bd52835c66cf6cf78f060a467a92a85f1d667447ea8feefdd9bccba7d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 FleurDeLeah-Regular.ttf $out/share/fonts/truetype/FleurDeLeah-Regular.ttf
  '';

  meta = with lib; {
    description = "Fleur De Leah";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
