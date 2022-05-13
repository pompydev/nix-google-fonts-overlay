{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "sawarabi-mincho-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/bf19077ade7be4fb171532fb14f94391406a01c6/ofl/sawarabimincho/SawarabiMincho-Regular.ttf?raw=true";
      name = "SawarabiMincho-Regular.ttf";
      sha256 = "86373c619710d1528aac3a4d47ce96834101bb38b057235b39e47b61ba143c6d";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SawarabiMincho-Regular.ttf $out/share/fonts/truetype/SawarabiMincho-Regular.ttf
  '';

  meta = with lib; {
    description = "Sawarabi Mincho";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
