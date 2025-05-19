{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hepta-slab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/heptaslab/HeptaSlab%5Bwght%5D.ttf?raw=true";
      name = "HeptaSlab_wght_.ttf";
      sha256 = "737badc7944d5b6f92c05919995240d6ea70e86bebe45d196e61677e7a901f29";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 HeptaSlab_wght_.ttf $out/share/fonts/truetype/HeptaSlab_wght_.ttf
  '';

  meta = with lib; {
    description = "Hepta Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
