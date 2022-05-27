{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "gowun-dodum-${version}";
  version = "2022-05-23-214203";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/16a2143d6f6d3a722f4c1bd96a76a637b952c412/ofl/gowundodum/GowunDodum-Regular.ttf?raw=true";
      name = "GowunDodum-Regular.ttf";
      sha256 = "a6e457933227483a11758fd0947bc74422a106d46f0bf057fdaa5af94a30067d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 GowunDodum-Regular.ttf $out/share/fonts/truetype/GowunDodum-Regular.ttf
  '';

  meta = with lib; {
    description = "Gowun Dodum";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
