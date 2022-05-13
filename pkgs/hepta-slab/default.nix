{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hepta-slab-${version}";
  version = "2022-04-16-030742";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/acfa4ad65f631d60c3473f1a2726716aa1467e0f/ofl/heptaslab/HeptaSlab[wght].ttf?raw=true";
      name = "HeptaSlab[wght].ttf";
      sha256 = "737badc7944d5b6f92c05919995240d6ea70e86bebe45d196e61677e7a901f29";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 'HeptaSlab[wght].ttf' $out/share/fonts/truetype/'HeptaSlab[wght].ttf'
  '';

  meta = with lib; {
    description = "Hepta Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
