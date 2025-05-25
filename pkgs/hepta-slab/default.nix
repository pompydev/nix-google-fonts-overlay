{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "hepta-slab-${version}";
  version = "2025-05-23-133205";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/c781e48f571fe26740a9814c0461064628cbd175/ofl/heptaslab/HeptaSlab%5Bwght%5D.ttf?raw=true";
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
