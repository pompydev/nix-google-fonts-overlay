{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "amiri-quran-colored-${version}";
  version = "2022-05-06-031916";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/35a8cf3bf9ae2f862abf63d18fdeadb70694fad1/ofl/amiriqurancolored/AmiriQuranColored-Regular.ttf?raw=true";
      name = "AmiriQuranColored-Regular.ttf";
      sha256 = "bd9e09601ac678059c6ceca3d6135934d3437118441becdc2bec9a229416a055";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 AmiriQuranColored-Regular.ttf $out/share/fonts/truetype/AmiriQuranColored-Regular.ttf
  '';

  meta = with lib; {
    description = "Amiri Quran Colored";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
