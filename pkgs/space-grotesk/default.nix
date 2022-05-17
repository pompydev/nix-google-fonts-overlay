{ lib, stdenv, fetchurl }:

stdenv.mkDerivation rec {
  name = "space-grotesk-${version}";
  version = "2022-05-16-221214";

  phases = [ "unpackPhase" "installPhase" ];

  srcs = [
    (fetchurl {
      url = "https://github.com/google/fonts/blob/2861cb7b12f90c0a294a12ed666e381e2211872f/ofl/spacegrotesk/SpaceGrotesk%5Bwght%5D.ttf?raw=true";
      name = "SpaceGrotesk_wght_.ttf";
      sha256 = "acad6de1fc93436f5c0f1f4137751ef04f1aea3063e7036535970ffcfbd79f72";
    })
  ];

  unpackPhase = ''
    for font in $srcs; do
      cp "$font" "$(echo "$font" | cut -d- -f2-)"
    done
  '';

  installPhase = ''
     install -Dm644 SpaceGrotesk_wght_.ttf $out/share/fonts/truetype/SpaceGrotesk_wght_.ttf
  '';

  meta = with lib; {
    description = "Space Grotesk";
    license = licenses.ofl;
    platforms = platforms.all;
  };
}
