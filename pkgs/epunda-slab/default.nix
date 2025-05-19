{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "epunda-slab-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/epundaslab/EpundaSlab%5Bwght%5D.ttf?raw=true";
      name = "EpundaSlab_wght_.ttf";
      sha256 = "201d278cfa91d1a1cde274dd7d59720c66de011f834e4aef959fc4f2a645202b";
    })
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/epundaslab/EpundaSlab-Italic%5Bwght%5D.ttf?raw=true";
      name = "EpundaSlab-Italic_wght_.ttf";
      sha256 = "f7ee1114b8986a5705a40bbfe826b499d4519f30c4ddf60dfbb66d4172dade99";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 EpundaSlab_wght_.ttf $out/share/fonts/truetype/EpundaSlab_wght_.ttf
     install -Dm644 EpundaSlab-Italic_wght_.ttf $out/share/fonts/truetype/EpundaSlab-Italic_wght_.ttf
  '';

  meta = with lib; {
    description = "Epunda Slab";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
