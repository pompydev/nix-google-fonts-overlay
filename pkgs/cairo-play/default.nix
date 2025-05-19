{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "cairo-play-${version}";
  version = "2025-05-16-181022";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/973a8934ba60f3a32a83617dce24edc3605fe3bb/ofl/cairoplay/CairoPlay%5Bslnt,wght%5D.ttf?raw=true";
      name = "CairoPlay_slnt,wght_.ttf";
      sha256 = "2c275b43ace54233a0960c3aa1d05b4e9e0e396a501cd3f8d446b16cc3362745";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 CairoPlay_slnt,wght_.ttf $out/share/fonts/truetype/CairoPlay_slnt,wght_.ttf
  '';

  meta = with lib; {
    description = "Cairo Play";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
