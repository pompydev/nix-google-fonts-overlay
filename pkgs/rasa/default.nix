{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "rasa-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3c5b833a98f01f157aa3d6dc2a1bb2dbc76ee36/ofl/rasa/Rasa%5Bwght%5D.ttf?raw=true";
      name = "Rasa_wght_.ttf";
      sha256 = "10d2f75aaf7b3f232c948c34584c49caf0cdd17a4c93eb7a5aeb3438efd42e19";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/f3c5b833a98f01f157aa3d6dc2a1bb2dbc76ee36/ofl/rasa/Rasa-Italic%5Bwght%5D.ttf?raw=true";
      name = "Rasa-Italic_wght_.ttf";
      sha256 = "ecea773edd1e87c3310a0fb811ec6102aea71da235f93bc2ce2506e81b3c21a7";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Rasa_wght_.ttf $out/share/fonts/truetype/Rasa_wght_.ttf
     install -Dm644 Rasa-Italic_wght_.ttf $out/share/fonts/truetype/Rasa-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Rasa";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
