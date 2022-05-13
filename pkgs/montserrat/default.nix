{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "montserrat-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fd60a948760465ea72ad844667bbf0799828a7fa/ofl/montserrat/Montserrat[wght].ttf?raw=true";
      name = "Montserrat[wght].ttf";
      sha256 = "faac83453081c6287619fffbb41e41c0a72c21f3fb6fbcd43d7d6a4f6221bced";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/fd60a948760465ea72ad844667bbf0799828a7fa/ofl/montserrat/Montserrat-Italic[wght].ttf?raw=true";
      name = "Montserrat-Italic[wght].ttf";
      sha256 = "970a7595f5468e87be6107ffc86b93d4af21ed50293b2571186f6c89bece9d1f";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'Montserrat[wght].ttf' $out/share/fonts/truetype/'Montserrat[wght].ttf'
     install -Dm644 'Montserrat-Italic[wght].ttf' $out/share/fonts/truetype/'Montserrat-Italic[wght].ttf'
  '';

  meta = with lib; {
    description = "Montserrat";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
