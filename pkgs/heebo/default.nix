{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "heebo-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/902785a6e34f09caa1768877c59d3eeb1b299378/ofl/heebo/Heebo[wght].ttf?raw=true";
      name = "Heebo_wght_.ttf";
      sha256 = "a805a36fbd459d8582d23b452c74ccd66d38d39f45a33a700030488ad6ec7614";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 Heebo_wght_.ttf $out/share/fonts/truetype/Heebo_wght_.ttf
  '';

  meta = with lib; {
    description = "Heebo";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
